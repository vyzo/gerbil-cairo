#!/usr/bin/env gxi

(import :std/build-script
        :std/make)

(defbuild-script
  `((gsc: "cairo/cairo"
          "-cc-options" ,(pkg-config-cflags "cairo")
          "-ld-options" ,(pkg-config-libs "cairo"))
    (ssi: "cairo")))
