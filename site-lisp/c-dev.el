(require 'ctypes)
(require 'cc-mode)
(require 'dev)

(defun make-c-pair-alist (char)
  (cond ((string= char "{") '(?\{ \n > _ \n ?} >))
	((string= char "\"") '(?\" _ "\""))
	((string= char "(") '(?\( _ ")"))
	((string= char "[") '(?\[ _ "]"))
	((string= char "\'") '(?\' _ "\'"))))

(defmacro make-c-auto-pair (characters func)
  `(progn
     (make-local-variable 'skeleton-pair-alist)
     (setf skeleton-pair-alist
	   ',(mapcar #'make-c-pair-alist characters))
     (setf skeleton-pair t)
     (dolist (char ',characters)
       (local-set-key char ,func))))

(defun my-c-mode-hook()
  (ctypes-auto-parse-mode 1)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (company-mode t)
  (company-begin-backend 'company-clang)
  (setq company-idle-dely t)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (smart-insert-operator-hook)
  (local-unset-key (kbd "."))
  (local-unset-key (kbd "!"))
  (local-unset-key (kbd "%"))
  (make-c-auto-pair ("(" "[" "{" "\"") 'self-insert-or-pair))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(provide 'c-dev)
