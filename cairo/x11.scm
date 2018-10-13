;;; © vyzo
;;; basic xlib bindings

(define XOpenDisplay
  (c-lambda (char-string) Display* "XOpenDisplay"))

(define DefaultScreen
  (c-lambda (Display*) int "DefaultScreen"))

(c-define-type Window "Window")

(define DefaultRootWindow
  (c-lambda (Display*) Window "DefaultRootWindow"))

(define XCreateSimpleWindow
  (c-lambda (Display*
        Window
        int                             ; x
        int                             ; y
        unsigned-int                    ; width
        unsigned-int                    ; height
        unsigned-int                    ; border-width
        unsigned-long                   ; border
        unsigned-long                   ; background
        )
       Window
       "XCreateSimpleWindow"))

(define XMapWindow
  (c-lambda (Display* Window) int "XMapWindow"))

(define DefaultVisual
  (c-lambda (Display* int) Visual* "DefaultVisual"))

(define window->drawable
  (c-lambda (Window) Drawable "___return (___arg1);"))

(define (cairo-create-x11-surface x y)
  (let* ((dsp (XOpenDisplay #f))
         (screen (DefaultScreen dsp))
         (win (XCreateSimpleWindow dsp (DefaultRootWindow dsp)
                                   0 0 x y 0 0 0))
         (da (window->drawable win)))
    (XMapWindow dsp win)
    (let ((sfc (cairo-xlib-surface-create dsp da (DefaultVisual dsp screen) x y)))
      (cairo-xlib-surface-set-size sfc x y)
      sfc)))
