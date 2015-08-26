---
title: "Elixir Prelude: Packing up utility functions"
created_at: 2015-08-21 11:41:48 -0500
kind: article
location: Toronto
tags: tech, elixir
---


## Introduction
I've been spending the summer in China, head-deep in [Elixir](http://elixir-lang.org/), writing interactive scripts for an [EdX MOOC on inquiry and technology for teachers](https://www.edx.org/course/teaching-technology-inquiry-open-course-university-torontox-inq101x) ([screenshots](https://imgur.com/a/rAXVz)). I will have much more to share about that project later, but now I wanted to share a small Elixir package I released on Github called [Prelude](https://github.com/houshuang/elixir-prelude) ([documentation](https://houshuang.github.io/prelude)). This is a collection of utility functions for Elixir that I've extracted out of my code base.

## Organization
I began by scattering these utility functions all over as small `defp`s, but when I wanted to reuse them in other modules, I began gathering them. Initially I had a single file called Prelude - modelled after the Haskell Prelude, just because it was the only file I'd ever wholesale `import` into my other modules.

Eventually I began separating the code out into sub-modules, which meant I went from

```elixir
import Prelude

map_atomify(...)
```

to

```elixir
Prelude.Map.atomify(...)
```

which seems cleaner.

## The point of gathering "trivial" functions
Many of these functions are very simple, but yet things you use all the time - gathering them together both means less repetition and greater legibility. Compare:

```elixir
x
|> Enum.map(fn {k, v} -> {v, k} end)
|> Enum.into(%{})
```

to

```elixir
x
|> Prelude.Map.switch
```

The code in the first version is short enough that I wouldn't bother making it a separate function, but the intent of the second snippet is much clearer. I might also forget to do `Enum.into(%{})`, and somehow I always forget the `end` in anonymous functions. So, some quick time saving.

## Map functions
Some of the functions are a bit more involved, mainly found in the [Prelude.Map](http://houshuang.github.io/prelude/Prelude.Map.html) module. I was inspired by the way Clojurists often work with deeply nested maps, sometimes keeping the entire application state in one `atom`. This has also become relevant in Javascript-land with experiments around immutable state such as [Baobab](https://github.com/Yomguithereal/baobab).

I see deeply nested maps much less often in Elixir. Part of it might be the architecture (we use gen_servers, message passing, and ETS tables, rather than atom-swapping), but part of it might also be because of the syntax (`%{%{%{}}}` is not pretty).

However, Elixir already has `get_in` and `put_in` to reach into deeply nested objects. Prelude provides `deep_put`, which is a parallel to `mkdir -p`, it will insert an object and create any part of the missing path. If you put to a path that already exists, it will turn it into an array.

Built on top of `deep_put` is `group_by`. Building the Phoenix app, I often had to extract data from the database using Ecto, and render it in templates. Let's say you have a table of students, listing their group affiliation, and which class their in. You wish to list all students, sorted by class, and then by group. With `group_by`, you can get the data from Ecto like this:

```elixir
MyRepo.all(Student)
|> Prelude.Map.group_by([:class, :group])
```

The result will be a map of classes. Each class will point to a map of groups, and each group will point to a list of students in that group. Then in an EEx template, you can display the list like this:

```elixir
<%= for class <- @classes %>
  <h2><%= class %></h2>
  <%= for group <- class %>
    <h3><%= group %></hr>
    <%= for student <- group %>
      <li><%= student %></li>
    <% end %>
  <% end %>
<% end %>
```

## Wrapping up
Anyway, the code is available, so feel free to browse around. I will be using this in my future projects, and probably adding functionality that is general enough to stand on its own. I'd love to add tests, and am happy to think about naming, APIs etc, if anyone else think this is interesting.

It's also my first time to use [ExDoc](https://github.com/elixir-lang/ex_doc) and [Github Pages](https://pages.github.com/), but both were a breeze.
