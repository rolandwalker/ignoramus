[![Build Status](https://secure.travis-ci.org/rolandwalker/ignoramus.png?branch=master)](http://travis-ci.org/rolandwalker/ignoramus)

Overview
========

Ignore backups, build files, *et al*. in Emacs.

Quickstart
----------

```lisp
(require 'dired-x)
 
(require 'ignoramus)
 
(ignoramus-setup)    ; sets vc-directory-exclusion-list,
                     ; dired-omit-files, ido-ignore-directories,
                     ; completion-ignored-extensions, etc.
 
;; execute C-x C-j   ; backups and build files now omitted from dired
```

Explanation
-----------

Every library has its own method for defining uninteresting files
to ignore.  Ignoramus puts the listing of ignorable-file patterns
and the logic for applying those patterns together in one place.

To use ignoramus, place the ignoramus.el library somewhere Emacs
can find it, and add the following to your `~/.emacs` file:

```lisp
(require 'ignoramus)
(ignoramus-setup)
```

By default, `ignoramus-setup` will apply every action that it
knows about for ignoring files.  Currently these are

	comint
	completions
	dired
	eshell
	grep
	ido
	nav
	pcomplete
	projectile
	shell
	speedbar
	vc

You can specify a shorter list of actions as an argument

```lisp
(ignoramus-setup '(pcomplete shell ido))
```

or customize the value of `ignoramus-default-actions`.

Compatibility and Requirements
------------------------------

	GNU Emacs version 24.3-devel     : yes, at the time of writing
	GNU Emacs version 24.1 & 24.2    : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.3 and lower : no

No external dependencies

Notes
-----

Three functions are provided to be called from Lisp:

	ignoramus-boring-p
	ignoramus-register-datafile
	ignoramus-matches-datafile

Bugs
----

The one-size-fits-all approach necessarily makes this library
a blunt instrument.
