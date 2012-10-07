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
               :alexandria

               :lispbuilder-sdl
               :cl-opengl)

  :components ((:module "src" :components
                        ((:file "package")
                         (:file "helpers" :depends-on ("package"))

                         (:file "pppp" :depends-on ("package" "helpers"))
                         (:file "init" :depends-on ("pppp"))
                         (:file "loop" :depends-on ("pppp"))))))
