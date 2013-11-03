(require 'dev)

(defun my-emacs-lisp-mode-hook ()
  (company-mode t)
;  (make-auto-pair ("(" "\"" "{" "[" ) 'self-insert-or-pair))
)
  
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

(provide 'elisp-dev)
