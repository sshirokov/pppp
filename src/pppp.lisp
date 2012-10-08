(in-package :pppp)

;;
;; Logging categories
;;
(defcategory fps)
(defcategory pppp)


;;
;; Main `pppp' container
;;
(defclass pppp ()
  ((title :initarg :title
          :initform "Parenthesis Powered Pixel Pusher"
          :accessor title)
   (screen-width :initarg :screen-width
                 :initarg :width
                 :initform 1024
                 :accessor screen-width
                 :accessor width)
   (screen-height :initarg :screen-height
                  :initarg :height
                  :initform 768
                  :accessor screen-height
                  :accessor height)
   (screen :accessor screen)))


;;
;; Generics
;;
(defgeneric draw (pppp))
(defgeneric tick (pppp timestep elapsed))
(defgeneric run (pppp &key))


;;
;; Drawing
;;
(defmethod draw :before ((pppp pppp))
  (gl:clear :color-buffer-bit :depth-buffer-bit)
  (gl:matrix-mode :modelview)
  (gl:load-identity)
  (gl:translate (/ (screen-width pppp) 2.0)
                (/ (screen-height pppp) 2.0)
                0))

;; TODO: Stubs
(defmethod tick (ppppp expected elapsed))
(defmethod draw ((pppp pppp)))
