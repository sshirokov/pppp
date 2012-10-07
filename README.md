Just a sandbox to try to covert a series of parenthesis
into colors and posibly shapes. There are very few stated
goals.

## Requirements

[SBCL](http://www.sbcl.org/) with thread support.

[GNU Make](http://www.gnu.org/software/make/)

## Setup

```bash
$ git clone https://github.com/sshirokov/pppp.git
$ cd pppp
$ make develop
```

This should put you in a position where you can fire up your lisp REPL (or run `make lisp` to open one)
and be able to evaluate `(ql:quickload :pppp)` without any issues.

From here, there is only forever.