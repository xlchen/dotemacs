(require 'dev)
(require 'pymacs)

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
;  (setenv "PYMACS_PYTHON" "python")
  (autoload 'pymacs-load "pymacs" nil t)
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-exec "pymacs" nil t)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)
  (define-key python-mode-map [(meta ?/)] 'rope-code-assist)
  (setq rope-confirm-saving 'nil)
  (setq ropemacs-guess-project t))

(add-hook 'python-mode-hook 'load-ropemacs)

(defun my-python-mode-hook ()
  (company-mode t)
  (setq company-idle-dely nil)
  (make-auto-pair ("(" "\"" "\'" "[" "{") 'self-insert-or-pair)
  (smart-insert-operator-hook)
  (local-unset-key (kbd "."))
  (local-unset-key (kbd ":")))
  
(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-dev)
