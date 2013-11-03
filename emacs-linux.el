(add-to-list 'load-path "~/.emacs.d/template/lisp/")

(require 'tramp)
(setq tramp-default-user "xchen0")

(setenv "PYMACS_PYTHON" "/usr/bin/python")
;(require 'site-gentoo)
(defvar my-lisp "/usr/bin/sbcl")

(menu-bar-mode -1)
