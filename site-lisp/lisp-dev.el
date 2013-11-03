(require 'slime)
(require 'dev)

(setq inferior-lisp-program my-lisp) ; your Lisp system

(setq slime-lisp-implementations
      `((sbcl (,my-lisp))))

;(setq slime-net-coding-system 'utf-8-unix)

(eval-after-load "slime"
   '(slime-setup '(slime-fancy slime-banner slime-asdf)))

(add-hook 'lisp-mode-hook 
	  '(lambda ()
	     (slime-mode t)
	     (make-auto-pair ("(" "\"" "{" "[") 'self-insert-or-pair)
	     (local-set-key [(kbd "C-c C-q")] 'slime-close-all-parens-in-sexp)))

(add-hook 'inferior-lisp-mode-hook 
	  '(lambda ()
	     (inferior-slime-mode t)
	     (company-mode t)
	     (local-set-key [(control c) (control q)] 'slime-close-all-parens-in-sexp)))

(defun my-slime-repl-mode-hook ()
  (make-auto-pair ("(" "\"" "{" "[") 'self-insert-or-pair)
  (local-set-key [(control c) (control q)] 'slime-close-all-parens-in-sexp))

(add-hook 'slime-repl-mode-hook
	  'my-slime-repl-mode-hook)

(define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
(define-key slime-mode-map [(control c) (control q)] 'slime-close-all-parens-in-sexp)
					
(provide 'lisp-dev)
