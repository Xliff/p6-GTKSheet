# GTKSheet bindings for Perl6

![Screenshot](/grabs/Basic_Sheet.png?raw=true "Perl6 GTKSheet Sample1")

This is an extremely experimental project, and getting it to work requires checking out several git repositories.

Here are the installation instructions for those of you wanting to experiment:

- First, create a working directory for all of the repositories
- Next, check out my working branch of timotimo's Cairo for Perl6 (PRs forthcoming):

```
$ git clone https://github.com/Xliff/cairo-p6.git
$ cd cairo-p6
$ git checkout cairo_path_t
```

- Next, check out my forthcoming Pango module:

```
$ git clone https://github.com/Xliff/p6-Pango.git
```

- Then checkout p6-GtkPlus

```
$ git clone https://github.com/Xliff/p6-GtkPlus.git
```

- And finally, checkout GTKSheet

```
$ git clone https://github.com/Xliff/p6-GtkSheet.git
```

- Now finally run the project. Be prepared to wait a LONG time the first time you do this (Sorry!).  Be sure to adjust the -I directives for your environment.

```
$ cd p6-GtkSheet
$ perl6 --stagestats -I../cairo-p6/lib -I../p6-Pango/lib -I../p6-GtkPlus/lib -Ilib t/01-basic.t
```

Please share compile times and your environment from the last command, [here](/../../issues/1).

I will work on making this all less complex, in time. Thanks for your interest!
