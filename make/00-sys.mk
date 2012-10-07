#-*- mode:makefile-gmake; -*-
LISP_BIN ?= $(shell which sbcl || echo /sbcl/does/not/exist)
LISP_PREFIX ?= CL_SOURCE_REGISTRY='$(ROOT):$(ROOT)/vendor//'
LISP ?= $(LISP_PREFIX) $(LISP_BIN)

LISP_EVAL_ARG = '--eval'
LISP_LOAD_ARG = '--load'

SHUTUP = > /dev/null 2> /dev/null
NODEBUG ?= $(LISP_EVAL_ARG) '(sb-ext:disable-debugger)'

.PHONY: lisp-cmd lisp-clean lisp-fasl-clean

lisp: $(LISP_BIN) | init
	$(LISP)

lisp-clean:
	@echo "=> Clearing common-lisp cache"
	rm -rf ~/.cache/common-lisp/

lisp-fasl-clean:
	@echo "=> Clearing fasls from $(ROOT)"
	find $(ROOT) -name '*.fasl' -delete
