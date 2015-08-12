[![Build Status](https://secure.travis-ci.org/rolandwalker/ignoramus.png?branch=master)](http://travis-ci.org/rolandwalker/ignoramus)

# Overview

Ignore backups, build files, *et al*. in Emacs.

 * [Quickstart](#quickstart)
 * [Explanation](#explanation)
 * [Compatibility and Requirements](#compatibility-and-requirements)
 * [Notes](#notes)
 * [Bugs](#bugs)

## Quickstart

```elisp
(require 'dired-x)
 
(require 'ignoramus)
 
(ignoramus-setup)    ; sets vc-directory-exclusion-list,
                     ; dired-omit-files, ido-ignore-directories,
                     ; completion-ignored-extensions, etc.
 
;; execute C-x C-j   ; backups and build files now omitted from dired
```

## Explanation

Every library has its own method for defining uninteresting files
to ignore.  Ignoramus puts the listing of ignorable-file patterns
and the logic for applying those patterns together in one place.

To use ignoramus, place the `ignoramus.el` library somewhere Emacs
can find it, and add the following to your `~/.emacs` file:

```elisp
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

```elisp
(ignoramus-setup '(pcomplete shell ido))
```

or customize the value of `ignoramus-default-actions`.

## Compatibility and Requirements

	GNU Emacs version 25.1-devel     : not tested
	GNU Emacs version 24.5           : not tested
	GNU Emacs version 24.4           : yes
	GNU Emacs version 24.3           : yes
	GNU Emacs version 23.3           : yes
	GNU Emacs version 22.2           : yes, with some limitations
	GNU Emacs version 21.x and lower : unknown

No external dependencies

## Notes

Three functions are provided to be called from Lisp:

	ignoramus-boring-p
	ignoramus-register-datafile
	ignoramus-matches-datafile

## Bugs

The one-size-fits-all approach necessarily makes this library
a blunt instrument.
