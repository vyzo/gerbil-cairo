;;; -*- scheme -*-

;;; This file is part of Cairo's bindings for Gambit-C
;;;
;;; Copyright (C) 2008  Marco Benelli <mbenelli@yahoo.com>
;;;
;;; This library is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU Lesser General Public
;;; License as published by the Free Software Foundation; either
;;; version 2.1 of the License, or (at your option) any later version.
;;;
;;; This library is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this library; if not, write to the Free Software
;;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


(c-declare "#include <cairo.h>")
(c-declare "#include <cairo-ft.h>")
(c-declare "#include <cairo-pdf.h>")
(c-declare "#include <cairo-ps.h>")
(c-declare "#include <cairo-svg.h>")
(c-declare "#include <cairo-xlib.h>")

(c-declare "#include <X11/Xlib.h>")
(c-declare "#include <fontconfig/fontconfig.h>")
(c-declare "#include <ft2build.h>")
(c-declare "#include FT_FREETYPE_H")

(define CAIRO_FORMAT_ARGB32 0)
(define CAIRO_FORMAT_RGB24 1)
(define CAIRO_FORMAT_A8 2)
(define CAIRO_FORMAT_A1 3)
(define CAIRO_FORMAT_RGB16_565 4)

;;; C types not already known by Gambit
(c-define-type double*  (pointer double))
(c-define-type void*  (pointer void))
(c-define-type char*  char-string)
(c-define-type int*  (pointer int))
(c-define-type unsigned-char*  (pointer unsigned-char))

;;; X-Window types
(c-define-type Display "Display")
(c-define-type Display* (pointer Display))

(c-define-type Screen "Screen")
(c-define-type Screen* (pointer Screen))

(c-define-type Visual "Visual")
(c-define-type Visual* (pointer Visual))

(c-define-type Drawable unsigned-long)
(c-define-type Pixmap unsigned-long)

;;; FreeType types
;; (c-define-type FT-Face (type "FT_Face"))
;; (c-define-type FcPattern (struct "FcPattern"))
;; (c-define-type FcPattern* (pointer "FcPattern"))

;(c-define-type cairo-font-face-t "cairo_font_face_t")
;(c-define-type cairo-font-face-t* (pointer "cairo_font_face_t"))

(c-define-type FT-Face "FT_Face")
(c-define-type FcPattern "FcPattern")
(c-define-type FcPattern* (pointer "FcPattern"))


;;; Windows types FIXME
;(c-define-type LOGFONTW* (pointer (pointer "LOGFONTW")))
;(c-define-type HFONT "HFONT")
;(c-define-type HDC "HDC")

;;; Additional types

(c-define-type cairo-bool-t   (type "cairo_bool_t"))

(c-define-type cairo-status-t   (type "cairo_status_t"))
(c-define-type cairo-status-t*  (pointer cairo-status-t))
(c-define-type cairo-status-t** (pointer cairo-status-t*))

;;; FIXME
;(c-define-type cairo-svg-version-t (type "cairo_svg_version_t"))
;(c-define-type cairo-svg-version-t** (pointer (pointer "cairo_svg_version_t")))

;(c-define-type cairo-destroy-func-t  (pointer "cairo_destroy_func_t"))
(c-define-type cairo-destroy-func-t  (function (void*) void))

(c-define-type cairo-user-data-key-t  (type "cairo_user_data_key_t"))
(c-define-type cairo-user-data-key-t*  (pointer cairo-user-data-key-t))

(c-define-type cairo-read-func-t  "cairo_read_func_t")
(c-define-type cairo-write-func-t  "cairo_write_func_t")
