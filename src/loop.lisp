;;
;; Main loop
;;
(in-package :pppp)

(defmethod tick (ppppp dt)
  (format t "Tick: ~S~%" dt))

(defmethod run :around ((pppp pppp) &key)
  "Setup the traps, int the right parts of SDL"
  (sb-int:with-float-traps-masked (:divide-by-zero :invalid :inexact :underflow :overflow)
    (sdl:with-init (sdl:SDL-INIT-AUDIO sdl:SDL-INIT-VIDEO)
      (call-next-method))))

(defmethod run ((pppp pppp) &key)
  (sdl:with-events (:poll)
    (:quit-event () (close pppp))
    (:idle
     (sdl:with-timestep
       (tick pppp (sdl:dt)))

     (draw pppp)

     ;; Finish the frame
     (log-for (fps) "FPS: ~F" (sdl:average-fps))
     (sdl:update-display))))
