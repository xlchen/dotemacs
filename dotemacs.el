(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7fa9dc3948765d7cf3d7a289e40039c2c64abf0fad5c616453b263b601532493" "b7b39f36c60eb3a70a7f4d2593d5ab00ba673121" default)))
 '(safe-local-variable-values
   (quote
    ((emacs-lisp-docstring-fill-column . 75)
     (Package . CLOS)
     (Syntax . Common-Lisp)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(cond
 ((not (boundp 'initial-window-system)) (load "emacs-console"))
 ((memq system-type '(windows-nt cygwin)) (load "emacs-win"))
 ((memq system-type '(gnu/linux)) (load "emacs-linux"))
 ((memq system-type '(darwin)) (load "emacs-mac")))

(load "emacs-redef")
(load "emacs-setup")
