(ql:quickload :cffi)

(let (tried)
  (labels ((cocoahelper-p (c)
             (and (typep c 'condition)
                  (equalp '(:FRAMEWORK "cocoahelper")
                          (assoc :framework (car (simple-condition-format-arguments c))))))

           (handler (c)
             (when (and (not tried) (cocoahelper-p c) (find-restart 'asdf:retry))
               (let* ((ql-path (asdf:system-source-directory (asdf:find-system :quicklisp)))
                      (ql-dir (pathname-directory ql-path))
                      (ql-root (reverse (rest (reverse ql-dir))))
                      (ql-str (namestring (make-pathname :directory ql-root)))
                      (res (and (> (length ql-str) 0)
                                (asdf:run-shell-command "find ~s -name 'cocoahelper' | xargs make -C" ql-str))))
                 (if (not (equalp res 0))
                   (format *error-output* ">> Compilation of cocoahelper failed, not invoking retry~%")
                   (progn
                     (setf tried t)
                     (invoke-restart (find-restart 'asdf:retry))))))))

    (handler-bind ((CFFI:LOAD-FOREIGN-LIBRARY-ERROR #'handler))
      (ql:quickload :lispbuilder-sdl))))
