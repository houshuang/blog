---
title: "Sending and receiving email with Elixir"
created_at: 2015-09-03 11:41:48 -0500
kind: article
location: Toronto
tags: tech, elixir
---

Yesterday there was a Twitter discussion about adding a default mailer to Elixir Phoenix ([Storify](https://storify.com/houshuang/mail-in-phoenix)). I've never used the Ruby on Rails mailer, but I got inspired to share my experience with both sending and receiving emails in a recent project.

This summer, I ran [a Phoenix server](https://github.com/houshuang/survey) that provided interactive content for [an EdX MOOC](https://www.edx.org/course/teaching-technology-inquiry-open-course-university-torontox-inq101x). One peculiarity of the setup was that authentication happened through the LTI connection with EdX, so there was no need for a sign-up/login form, confirmation of email addresses etc. However, we used email for a number of other purposes.

## Sending email
To send email, you need an SMTP server. While Elixir is perfectly capable of handling this on its own, I had heard a lot of stories of how email from private domains might hit spam-filters, and be difficult to configure correctly, so we looked around for an external provider. [Amazon Simple Email Service](https://aws.amazon.com/ses/) is a no-frills service with a great price-point (currently 0.10$ per 1000 emails). It might not have all the bells and whistles of services like [Mailgun](http://www.mailgun.com/) and [Sendgrid](https://sendgrid.com/), but for our purposes it worked great.

![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-01.png)
Amazon SES has a web API, but the easiest way to use it is simply to configure it as an outgoing SMTP server. Looking around, I found the [Mailman library](https://github.com/kamilc/mailman), which was easy enough to configure ([my code](https://github.com/houshuang/survey/blob/master/lib/mailer.ex)). You simply define a struct like this (storing credentials in a config file):

```elixir
  def config do
    %Mailman.Context{
      config: %Mailman.SmtpConfig{
        username: Application.get_env(:mailer, :username),
        password: Application.get_env(:mailer, :password),
        relay: Application.get_env(:mailer, :relay),
        port: 587,
        tls: :always,
        auth: :always}
    }
  end
```

For each email to send, you construct a message struct like this ([many examples](https://github.com/houshuang/survey/blob/master/lib/mail.ex)):

```elixir
  %Mailman.Email{
      subject: "#{entered} entered the collaborative workbench",
      from: "noreply@mooc.encorelab.org",
      to: [email],
      text: text,
      html: html }
  end
```

and then use `Mailman.deliver(email, config)`.

To generate the email contents, I used EEx templates which I manually precompiled. You can see [a list of templates](https://github.com/houshuang/survey/tree/master/data/mailtemplates), and [the module that precompiles them](https://github.com/houshuang/survey/blob/master/lib/mail/templates.ex).

## Asynchronicity and error handling
This worked beautifully when I was testing it with individual emails, but when I wanted to send out a large number of emails (for example personalized weekly updates), I found that some emails were silently dropped. It turns out that Amazon SES has a daily limit, which for me was lifted to 50,000 emails (more than I would ever need), but also a rate-limitation, which for me was 14 emails per second. Apparently Elixir is just too fast, and Amazon would just return an error whenever it went above that rate.

![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-02.png)

To fix this, the first issue was to correctly detect errors, but Mailman seemed to return `:ok` tuple no matter what. [Looking into their code](https://github.com/kamilc/mailman/blob/30715434e20b6a06528d350df11ddb143def8e18/lib/mailman/external_smtp_adapter.ex#L15:L22), I found that requests to deliver led to some processing of the structs, and then passing them on to `:gen_smtp_client.send_blocking` using Task.async, and then immediately returning an `:ok` tuple. Personally, I think that libraries should let users decide on their own concurrency strategy, and hiding the errors is a big problem. I have a [pull request](https://github.com/kamilc/mailman/pull/16/files) pending which changes the function to call the `:gen_smtp_client` function directly, and in the meantime I am using my own fork of Mailman.

With this change, we do indeed get access to the error messages from Amazon, but we still need to handle catching errors, retrying etc. To solve this problem, I began writing my own task queue library, with the idea that it should be possible to specify different "Quality of Service" levels, including number of retries, max requests per second, time to wait per retry etc. My initial experiments need to be rewritten almost completely, and extracted into its own package, but even this simplified approach was used to send thousands of emails, scrape hundreds of websites every hours, etc. ([1](https://github.com/houshuang/survey/blob/master/web/models/job.ex), [2](https://github.com/houshuang/survey/blob/master/lib/job_worker.ex))

## User-specific links
![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-03.png)

As mentioned above, the application had no login screen, so we wanted to include links in the emails that let the users directly access the content linked to. I had already written [a generic cache function](https://github.com/houshuang/survey/blob/master/web/models/cache.ex), which stores any arbitrary Erlang term (using a [custom Ecto type](https://github.com/houshuang/survey/blob/master/lib/extensions/ecto_term.ex)) returning a simple index (and checking for uniqueness). I used this, together with the [hashids](https://github.com/alco/hashids-elixir) library to generate shorturls for specific URLs and user ids ([source](https://github.com/houshuang/survey/blob/master/lib/mail.ex)):

```elixir
  def gen_url(id, url) do
    term = %{url: url, userid: id}
    id = Survey.Cache.store(term)
    hash = Hashids.encode(@hashid, id)
    @basename <> "/email/" <> hash
  end
```

When a user reached the /email/ controller, I simply extracted the id from the hashid, looked up in the cache store, retrieved the user from the database, and set the appropriate session variables to "log in" the user, before redirecting to the appropriate URL ([source](https://github.com/houshuang/survey/blob/master/web/controllers/email_controller.ex)):

```elixir
def redirect(conn, %{"hash" => hash}) do
    {:ok, [id]} = Hashids.decode(@hashid, String.strip(hash))
    struct = Survey.Cache.get(id)
    hash = (from f in Survey.User,
    where: f.id == ^struct.userid,
    select: f.hash) |> Repo.one
    conn
    |> put_session(:repo_id, struct.userid)
    |> put_session(:lti_userid, hash)
    |> ParamSession.redirect(struct.url)
  end
```

In each email, I also included a link to unsubscribe from all email notifications, or from the specific type of notification (for example, you might still want to receive weekly updates, but not notifications every time someone posted something), and I checked
whether someone had unsubscribed before sending out notifications. These links also had the userid encoded, and just displayed a page showing "Success!", rather than a form asking the user to enter email and password, etc.

In addition to user-specific links, we could also customize the content of the emails based on user data in the database. Below is an example of an email that is both using a fancy HTML template (easy to do with EEx), and containing user-specific information:

![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-04.png)

## Receiving emails
I was very pleased with how well Elixir and Mailman was able to handle the sending of emails, and I managed to use quite a lot of Elixir features in implementing the tasks above (parallelism, worker queues, genservers, Ecto and custom types, EEx templates, etc). However, just sending emails isn't in itself anything extraordinary, any framework should support it at some level. Receiving emails seems like it would add a whole other level of complexity, though.

In our project, we wanted to support small-group collaboration and communication between members who had never met, and were often separated by timezones. We already had embedded Etherpad, wiki and live chat, and we made it more likely that people would meet each other online, by sending out notifications whenever a group member entered the online environment. In addition, I had the idea of generating ad-hoc mailing lists for group discussion. However, one limitation was that we could not share users email addresses with anyone, due to privacy concerns.

I looked into whether there were some mailing list system that we could install on the server, with an API that would let us dynamically add mailing lists and members etc. However, when I came across [gen_smtp](https://github.com/Vagabond/gen_smtp) (which Mailman is built on top of), I realized that Erlang could handle this all by itself - and in a very simple manner.

Since Mailman doesn't wrap the receiving functionality of gen_smtp, I had to dig into the Erlang code and documentation to understand how to set it up. While I love the flexibility you get by defining your own callback-based SMPT server, it does seem that most people simply want to receive emails and do something with the contents. Luckily, the repository has [an example implementation](https://github.com/Vagabond/gen_smtp/blob/master/src/gen_smtp_server.erl).

I had a few hiccups figuring out how to set up the server. First, I somehow spent an unreasonable amount of time figuring out how to start the server from my Application configuration (translating the Erlang invocation into Elixir), although the result is very simple ([source](https://github.com/houshuang/survey/blob/master/lib/survey.ex)):

```
 worker(:gen_smtp_server, [Mail.SMTPServer,
        Application.get_env(:mailer, :smtp_opts)]),
```

where the relevant line from the config file is:

```
  smtp_opts: [[port: 3000, sessionoptions: [certfile: 'server.crt', keyfile: 'server.key']]]
```

The keyfiles are for TLS verification. The reason for putting the port number in a config file, rather than directly in the Application invocation, is that only one process can listen to the port at the same time - so if you have a production instance running, and you want to fire up an IEx to experiment with some code, they will both try to listen to the same code, and the second process will fail.

The second issue was accessing port 25 on the server, which is the standard SMTP port. I didn't want to run my BEAM process as root, but by default, only root can bind to ports below 1024. I finally found the obscure answer in a [Stackoverflow post](http://stackoverflow.com/questions/413807/is-there-a-way-for-non-root-processes-to-bind-to-privileged-ports-1024-on-l), which is that executing `sudo /sbin/setcap 'cap_net_bind_service=ep' BINARY` on a BINARY gives that binary the privilege of listening to ports below 1024. I ran this command against the BEAM binary, and everything worked well.

I initially just tweaked the example module in Erlang to fit my purposes, but then decided to translate the file to Elixir, while removing a lot of the documentation comments and edge cases (which were mostly there to show the possibilities). The result was a very lean module that looks a lot less scary. You can see the whole [source](https://github.com/houshuang/survey/blob/master/lib/mail/smtp_server.ex), but I reorganized it so that the callbacks you are most likely to want to modify are at the top (shown below), and the callbacks that you should probably leave alone, are at the bottom (see source):

```elixir
defmodule Mail.SMTPServer do
    require Logger
    @behaviour :gen_smtp_server_session

    def init(hostname, session_count, address, options) do
        if session_count > 40 do
            Logger.warn('SMTP server connection limit exceeded')
            {:stop, :normal, ['421 ', hostname, ' is too busy to accept mail right now']}
        else
            banner = [hostname, ' ESMTP']
            state = %{}
            {:ok, banner, state}
        end
    end

    # possibility of rejecting based on _from_ address
    def handle_MAIL(from, state) do
        {:ok, state}
    end

    # possibility of rejecting based on _to_ address
    def handle_RCPT(to, state) do
        {:ok, state}
    end

    # getting the actual mail. all the relevant stuff is in data.
    def handle_DATA(from, to, data, state) do
        Mail.Receive.receive_message(from, to, data)
        {:ok, UUID.uuid5(:dns, "mooc.encorelab.org", :default), state}
    end
    [...]
```

All this does is give you the option of rejecting based on `from`, and `to` addresses, and then pass the entire message to a separate function for processing.

![ left](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-06.png)
The way we used this is to include a form in the web interface to initiate an email conversation.

Any emails sent through this form would be forwarded to all members of the group (who had not unsubscribed), with a unique `from` address, which encoded the group id using hashids. Replies to this email would reach the server, and be resent to all group members, without revealing the email address of the original sender.

![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-05.png)

## Conclusion
So there you have it. Social notifications, personalized emails, [error messages by email](http://reganmian.net/blog/2015/08/26/email-notifications-about-errors-in-elixir/), URLs that automatically log you in, ad-hoc mailing lists, and all with pure Elixir and Erlang. This whole experience really made me appreciate the Erlang/Elixir ecosystem. And for sending 13,500 emails in a month, I paid less than for a cup of coffee...

![](/blog/images/2015-09-03-sending-and-receiving-email-with-elixir_-_whole-07.png)

It would be interesting to discuss how we can improve the tooling around emails even more. Perhaps Mailman can be extended to also cover the server aspects of `gen_smtp`, perhaps we need better documentation (hopefully this blog post can be a modest contribution), or better integration with other libraries. But I think we're building on a great foundation!
