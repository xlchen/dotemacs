(require 'dev)

(defun my-css-mode-hook ()
  (make-auto-pair ("{") 'self-insert-or-pair))

(add-hook 'css-mode-hook 'my-css-mode-hook)

(provide 'css-dev)