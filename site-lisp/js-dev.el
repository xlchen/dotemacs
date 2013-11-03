(require 'dev)

(setq js-indent-level 4)

(defun my-javascript-mode-hook ()
  (interactive)
  (make-auto-pair ("(" "\"" "\'" "[" "{") 'self-insert-or-pair)
  (smart-insert-operator-hook)
  (local-unset-key (kbd "."))
  (local-unset-key (kbd ":")))

(add-hook 'js-mode-hook 'my-javascript-mode-hook)

(provide 'js-dev)
  
