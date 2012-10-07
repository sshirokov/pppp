;;
;; Initialization and teardown
;;
(in-package :pppp)

(defmethod initialize-instance :after ((pppp pppp) &key)
  "Initialize the screen surface and OpenGL subsystems of `pppp'"
  (setf (screen pppp)
        (sdl:window (width pppp) (height pppp)
                    :fps (make-instance 'sdl:fps-timestep :dt 10)
                    :title-caption (title pppp)
                    :icon-caption (title pppp)
                    :opengl t
                    :double-buffer t
                    :hw t
                    :opengl-attributes '((:SDL-GL-DOUBLEBUFFER 1))))

  ;; GL Init
  (gl:enable :texture-2d :depth-test)
  (gl:clear-depth 1.0)
  (gl:shade-model :smooth)
  (gl:clear-color 0 0 0 1)

  (gl:depth-func :lequal)

  (gl:matrix-mode :projection)

  (gl:load-identity)
  (gl:ortho 0 (width pppp) (height pppp) 0 -1 1))

(defmethod close ((pppp pppp) &key abort)
  "Tear down the `pppp' instance."
  (declare (ignore abort))
  (log-for (pppp) "Closing ~S"))
