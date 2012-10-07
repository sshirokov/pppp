cocoahelper: | quicklisp-test
	@echo "=> Attempting build of :lispbuilder-sdl with cocoahelper compile handler."
	$(LISP) $(NODEBUG) $(LISP_LOAD_ARG) make/cocoahelper.lisp $(LISP_EVAL_ARG) '(quit)'
	@echo "=> :lispbuilder-sdl built successfully!"
