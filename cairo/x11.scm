;;; © vyzo
;;; basic xlib bindings

(define XOpenDisplay
  (c-lambda (char-string) Display* "XOpenDisplay"))

(define XCloseDisplay
  (c-lambda (Display*) int "XCloseDisplay"))

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

(define XSelectInput
  (c-lambda (Display* Window long) int "XSelectInput"))

(define XFlush
  (c-lambda (Display*) int "XFlush"))

(define ButtonPressMask
  ((c-lambda () long "___return(ButtonPressMask);")))

(define KeyPressMask
  ((c-lambda () long "___return(KeyPressMask);")))

(define window->drawable
  (c-lambda (Window) Drawable "___return (___arg1);"))

(define (cairo-create-x11-surface x y)
  (let* ((dsp (XOpenDisplay #f))
         (screen (DefaultScreen dsp))
         (win (XCreateSimpleWindow dsp (DefaultRootWindow dsp)
                                   0 0 x y 0 0 0))
         (da (window->drawable win)))
    (XMapWindow dsp win)
    (XSelectInput dsp win (fxior ButtonPressMask KeyPressMask))
    (let ((sfc (cairo-xlib-surface-create dsp da (DefaultVisual dsp screen) x y)))
      (cairo-xlib-surface-set-size sfc x y)
      sfc)))

(define (cairo-destroy-x11-surface sfc)
  (let ((dsp (cairo-xlib-surface-get-display sfc)))
    (cairo-surface-destroy sfc)
    (XCloseDisplay dsp)))

(define (cairo-x11-pump-events sfc)
  (let ((dsp (cairo-xlib-surface-get-display sfc)))
    (cairo-x11-display-pump-events dsp)))

(define cairo-x11-display-pump-events
  (c-lambda (Display*) void
       "for (XEvent e; XPending (___arg1); XNextEvent (___arg1, &e)); ___return;"))
