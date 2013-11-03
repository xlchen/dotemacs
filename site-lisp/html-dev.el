(require 'dev)

(defun my-html-mode-hook ()
  (make-auto-pair ("\"" "\'" "<" "{") 'self-insert-or-pair))

(add-hook 'html-mode-hook 'my-html-mode-hook)

(provide 'html-dev)