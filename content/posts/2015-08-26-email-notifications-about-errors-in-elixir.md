---
title: "Email notifications about errors in Elixir"
created_at: 2015-08-26 11:41:48 -0500
kind: article
location: Toronto
tags: tech, elixir
---

This summer, I ran [a Phoenix server](https://github.com/houshuang/survey) that provided interactive content for [an EdX MOOC](https://www.edx.org/course/teaching-technology-inquiry-open-course-university-torontox-inq101x). Given the geographical distribution of students, the server was getting hit 24/7, and I wanted a quick way to get notified about any error messages. Elixir comes with a built-in [logging framework](http://elixir-lang.org/docs/v1.0/logger/) that has several levels of logging (debug, info, warn, error). Any processes crashing will emit error logs, and you can also emit them manually from your own code.

The stock logger only comes with a console backend. I ran the server through Ubuntu's `upstart` system with a very simple configuration script, which simply set some environment variables and paths, and then used `PORT=4000 MIX_ENV=prod mix phoenix.server` (I used Nginx to proxy the local port, and add SSL). I used `mosh` and `tmux` to keep a persistent connection, and `tail -f` to watch the upstart log. On the screenshot below, I had several panes tracking both the access log (using [plug_accesslog](https://github.com/mneudert/plug_accesslog)), the Phoenix log, and also a `grep` on `error` to see the latest error messages.

![](/blog/images/2015-08-26-email-notifications-about-errors-in-elixir_-_whole-01.png)

Due to BEAM (the Erlang virtual machine) and [OTP](http://elixir-lang.org/getting-started/mix-otp/supervisor-and-application.html), Phoenix is remarkably stable. The only time the whole server went down would be because of a serious issue in the datacenter rendering the entire virtual machine inaccessible. Errors were typically bugs that would occur given a certain edge case (for example trying to render the group of a user who had not selected a group yet). They would crash the connection of the user who hit that edge case, but would not propagate up the stack. Thus it would be quite possible for an error to occur and not be noticed, since everything else would continue happily running.

I decided I'd like to get an email every time an error was triggered. Luckily, the Elixir logger was built from the start as a pluggable system, and there are already a number of possible backends, feeding into [syslog](https://github.com/smpallen99/syslog), or several "monitoring as a service" systems like [Honeybadger](https://github.com/honeybadger-io/honeybadger-elixir) and [Crashdump.IO](https://github.com/crashdumpio/fink-elixir).

I had already integrated e-mail into my system, using [ Mailman ](https://github.com/crashdumpio/fink-elixir) to send email through [ AWS Simple Email Service ](https://aws.amazon.com/ses/) for notifications, and looking at the examples in Elixir, and the external loggers, writing a custom back-end that sends email notifications turned out to be remarkably simple.

Copying some code from the console backend, I ended up with [this module](https://github.com/houshuang/survey/blob/master/lib/error_mail.ex), with only 50+ lines of code, most of which handles config and setup. The real work is done in these two functions, first a `gen_event` callback whenever a message with level `error` is emitted, and which simply dispatches to the log_event function:

```elixir
def handle_event({:error, _gl, {_, msg, ts, md}}, state) do
  log_event(msg, ts, md, state)
  {:ok, state}
end
```

then the log_event function, which uses the [Logger.Formatter](http://elixir-lang.org/docs/v1.0/logger/Logger.Formatter.html) module to get the string to mail out, briefly checks against two kinds of errors which I did not want logged by email, and then composes and sends an email, using exactly the same functionality that I use for sending a new user notification.

```elixir
defp log_event(msg, ts, md, {from, to_list, format, metadata}) do
  msg = Logger.Formatter.format(format, :error, msg, ts, Dict.take(md, metadata))
        |> IO.iodata_to_binary
  if !String.contains?(inspect(msg), "GenServer :job_worker") &&
    !String.contains?(inspect(msg), "bad_charset") do
    %Mailman.Email{
      from: from,
      to: to_list,
      text: msg}
    |> Survey.Mailer.deliver
  end
end
```

This worked perfectly.

![](/blog/images/2015-08-26-email-notifications-about-errors-in-elixir_-_whole-02.png)

A trick when developing something like this, is to set the level to `warn` while developing. Otherwise, if you have an error in your logging code, emitting an error log message from IEx to test your code, will trigger an error log message about the error in your logger, which will trigger another one, etc. This also means that in general, it is very important to make sure that the error logging code cannot itself trigger errors. If sending the email might cause an error, it might be better for the mailer to be a separate gen_event, and for the logger to simple send a message to it.

There is no checking for duplicate errors in this system, which means that in a situation where a lot of errors are emitted, you will receive a lot of emails.

![](/blog/images/2015-08-26-email-notifications-about-errors-in-elixir_-_whole-03.png)

This sometimes happened when I forgot to do a `mix deps.get` after pushing new code that had an added dependency (I didn't use any kind of release management, but simply pushed code to Github, pulled it onto the server, and restarted the server). It once happened that an incoming e-mail triggered a panic with `gen_smtp` because of a failing charset - this e-mail was resent every ten minutes for 24 hours, which resulted in many error messages. It also happened that the server was rebooted into single-user mode because of a datacenter failure, which meant it could not connect to the database. Upstart will automatically restart the system on a crash, again resulting in a stream of error mails.

I'm not sure how one could handle this, because I think it makes sense to keep the error logging system as simple and robust as possible. A `gen_server` which handled e-mailing and kept counters would help to some extent, but not in the case of multiple restarts. In that situation, you would need an external service which aggregated emails and had conditional dispatch, and then you are getting into the level of building up a monitoring and reporting infrastructure, either internally or as a service.

However, this was a great first try - it did work very reliably, and it's also helpful to see that there is very little magic to `Logger` and the logger backends.
