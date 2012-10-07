Just a sandbox to try to covert a series of parenthesis
into colors and posibly shapes. There are very few stated
goals.

## Requirements

[SBCL](http://www.sbcl.org/) with **thread support**.

The code should be as portable as its dependencies, the scaffolding
should have enough hooks to be made portable, but only SBCL specific
defaults are shipping.

[GNU Make](http://www.gnu.org/software/make/) is used to bootstrap the
project. Is only needed for development, or where no other structure
to access lisp systems is in place.

THe only caveat of the `make develop` scaffold is that it ensures the `vendor/`
subdirectory is of a higher priority on the ASDF search path than usual.

## Setup

```bash
$ git clone https://github.com/sshirokov/pppp.git
$ cd pppp
$ make develop
```

This should put you in a position where you can fire up your lisp REPL (or run `make lisp` to open one)
and be able to evaluate `(ql:quickload :pppp)` without any issues.

### From here, there is only forever.