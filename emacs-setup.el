(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load-theme 'cyberpunk)

(tool-bar-mode -1)

(setq user-full-name "Xiaoliang Chen")
(setq user-mail-address "fvwmer@gmail.com")

(require 'ibuffer)
(require 'ido)

(ido-mode t)
(icomplete-mode t)

(set-language-environment 'utf-8)
(set-language-environment-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(setq column-number-mode t)
(show-paren-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

(defvar autosave-dir "~/.emacsbackup/")
(make-directory autosave-dir t)
(setq backup-directory-alist `((".*" . ,autosave-dir)))
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t))) 
(setq auto-save-list-file-prefix (concat autosave-dir "auto-save-list/.saves-"))

(desktop-save-mode 1)

(require 'template)
(template-initialize)
(add-to-list 'template-find-file-commands
             'ido-exit-minibuffer)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dired ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'dired-single-buffer "dired-single" "" t)
(autoload 'dired-single-buffer-mouse "dired-single" "" t)
(autoload 'dired-single-magic-buffer "dired-single" "" t)
(autoload 'dired-single-toggle-buffer-name "dired-single" "" t)
(global-set-key (kbd "C-x d") 'joc-dired-magic-buffer)

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))

(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq dired-omit-files "^\\.")
	    (dired-omit-mode 1)
	    (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (dired-single-buffer "..")))
	    (setq dired-use-magic-buffer t)))
	    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; auto-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(mapcar
; (function (lambda (setting)
;	     (setq auto-mode-alist
;		   (cons setting auto-mode-alist))))
; '(("\\.py\\'" . python-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; hooks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; dev modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'c-dev)
;(require 'python-dev)
(require 'elisp-dev)
(require 'lisp-dev)
(require 'html-dev)
(require 'css-dev)
(require 'js-dev)
;(require 'php-dev)
