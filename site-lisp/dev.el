;;common functionality used by kinds of different programming mode
;(require 'smart-operator)
(autoload 'company-mode "company" nil t)

(setq company--disabled-backends '(company-pysmell))
(add-hook 'after-init-hook 'global-company-mode)

(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)

;; (defun* my-comint-within-quotes (beg end &key mode)
;;   (labels ((init-target (mode)
;; 			(case mode
;; 			  (:double (format "\\(\\(\\=\\|[^\\\\]\\)\"\\)\\|\\(%s\\)" comment-start-skip))
;; 			  (34 "\\(\\=\\|[^\\\\]\\)\"")
;; 			  (:single (format "\\(\\(\\=\\|[^\\\\]\\)\'\\)\\|\\(%s\\)" comment-start-skip))
;; 			  (39 "\\(\\=\\|[^\\\\]\\)\'")
;; 			  (:both (format "\\(\\(\\=\\|[^\\\\]\\)[\"']\\)\\|\\(%s\\)" comment-start-skip)))))
;;     (let ((target (init-target mode))
;; 	  (found nil))
;;       (save-excursion
;; 	(goto-char beg)
;; 	(loop for pos = (search-forward-regexp target end t)
;; 	      while pos
;; 	      do (if found
;; 		     (setf found nil
;; 			   target (init-target mode))
;; 		   (let ((last-match (match-string 0)))
;; 		     (if (string-match-p (or comment-start-skip
;; 					     comment-start "something") last-match)
;; 			 (setf found last-match
;; 			       target (or comment-end-skip "\n"))
;; 		       (setf found (char-after (1- (point)))
;; 			     target (init-target found)))))))
;;       (and found t))))


;; (defun make-pair-alist (char)
;;   (cond ((string= char "{") '(?\{ _ "}"))
;; 	((string= char "\"") '(?\" _ "\""))
;; 	((string= char "(") '(?\( _ ")"))
;; 	((string= char "[") '(?\[ _ "]"))
;; 	((string= char "\'") '(?\' _ "\'"))
;; 	((string= char "<") '(?\< _ ">"))))

;; (defun* comint-within-quotes-2 (beg end)
;;   (labels ((test-mode-name (mode-name name)
;; 			   (if (stringp mode-name)
;; 			       (string= mode-name name)
;; 			     (member name mode-name))))
;;     (cond
;;      ((or (test-mode-name mode-name "Lisp")
;; 	  (test-mode-name mode-name "Emacs-Lisp")) (my-comint-within-quotes beg end :mode :double))
;;      (t (or (my-comint-within-quotes beg end :mode :both))))))

;; (defun self-insert-or-pair (arg)
;;   (interactive "*P")
;;   (if (comint-within-quotes-2 0 (point))
;;       (self-insert-command (prefix-numeric-value arg))
;;     (skeleton-pair-insert-maybe arg)))

;; (defmacro make-auto-pair (characters func)
;;   `(progn
;;      (make-local-variable 'skeleton-pair-alist)
;;      (setf skeleton-pair-alist
;; 	   ',(mapcar #'make-pair-alist characters))
;;      (setf skeleton-pair t)
;;      (dolist (char ',characters)
;;        (local-set-key char ,func))))

(provide 'dev)
