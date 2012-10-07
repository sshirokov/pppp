(defpackage :pppp
  (:use :cl :log5)

  (:export :pppp
           :output :debug))

(in-package :pppp)

;; We'll use log5 instead of STDIO
;; since it's a tad more flexible for the purpose.
(defcategory output)
(defcategory debug)
