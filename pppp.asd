(defpackage pppp-system
  (:use :asdf))
(in-package :pppp-system)

(defsystem :pppp
  :description "Parenthesis Powered Pixel Pusher"
  :version "0.0.0"
  :depends-on (:closer-mop
               :bordeaux-threads
               :arnesi
               :log5
               :alexandria)

  :components ((:module "src" :components
                        ((:file "package")
                         (:file "helpers" :depends-on ("package"))

                         ;; Basic reactor
                         (:file "pppp" :depends-on ("package" "helpers"))))))
