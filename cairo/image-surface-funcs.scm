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

(define cairo-image-surface-create (c-lambda (cairo-format-t int int) cairo-surface-t* "cairo_image_surface_create"))
(define cairo-image-surface-create-for-data (c-lambda (unsigned-char* cairo-format-t int int int) cairo-surface-t* "cairo_image_surface_create_for_data"))
(define cairo-image-surface-get-data (c-lambda (cairo-surface-t*) unsigned-char* "cairo_image_surface_get_data"))
(define cairo-image-surface-get-format (c-lambda (cairo-surface-t*) cairo-format-t "cairo_image_surface_get_format"))
(define cairo-image-surface-get-width (c-lambda (cairo-surface-t*) int "cairo_image_surface_get_width"))
(define cairo-image-surface-get-height (c-lambda (cairo-surface-t*) int "cairo_image_surface_get_height"))
(define cairo-image-surface-get-stride (c-lambda (cairo-surface-t*) int "cairo_image_surface_get_stride"))
