(add-to-list 'load-path "~/.emacs.d/template/lisp")
;(require 'slime-autoloads)

(defvar my-lisp "/usr/local/bin/sbcl")

(setenv "PYMACS_PYTHON" "/usr/local/bin/python2.7")

(set-face-attribute
  'default nil :font "Source Code Pro 14")
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "Songti SC" :size 14))
