(defvar backup-dir (expand-file-name "~/.tmp/"))
(defvar autosave-dir (expand-file-name "~/.tmp/"))

;; hide startup message and bars
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(defun startup-echo-area-message () "Ready")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode 0)
(show-paren-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; .emacs.d
(add-to-list 'load-path user-emacs-directory)

;; colors
(require 'tomorrow-night-theme)

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; write backups to a separate file
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq aut-save-file-name-transforms `((".*" ,autosave-dir t)))

(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; move to newly-created split
(global-set-key "\C-x2" (lambda ()
			  (interactive)
			  (split-window-vertically)
			  (other-window 1)))
(global-set-key "\C-x3" (lambda ()
			  (interactive)
			  (split-window-horizontally)
			  (other-window 1)))
;; auto indent by default
;; (define-key global-map (kbd "RET") 'newline-and-indent)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq my-el-get-packages
      '(autopair bundler switch-window el-get yaml-mode))

(el-get 'sync my-el-get-packages)

;; yaml mode
(add-to-list 'auto-mode-alist '("\\.yml" . yaml-mode))

;; org mode!
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)

;; various extensions

(require 'magit) ;; use AUR version
(require 'autopair)
(require 'switch-window)
(require 'rspec)

;; enotify
(add-to-list 'load-path "~/.emacs.d/enotify/")
(require 'enotify)
(require 'enotify-tdd)
(enotify-minor-mode t)

;;(global-linum-mode t)
;;(setq linum-format "%4d ")

;; erc config
(global-set-key "\C-cfr" (lambda () (interactive)
			   (erc :server "irc.freenode.net" :port 6666 :nick "dubdromic")))
(global-set-key "\C-cfo" (lambda () (interactive)
			   (erc :server "irc.foonetic.net" :port 6667 :nick "dubdromic")))

(require 'erc)
(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)

(setq erc-kill-server-buffer-on-quit t)
(setq erc-kill-buffer-on-quit t)

;; auto-complete

(add-to-list 'load-path "/usr/share/emacs/site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict")
(ac-config-default)

(setq rsense-home "/opt/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; ido mode

(require 'ido)
(ido-mode t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(erc-away-nickname "dubdromic")
 '(erc-email-userid "dubdromic")
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT")))
 '(erc-modules (quote (autojoin button completion irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track truncate)))
 '(erc-nick "dubdromic")
 '(erc-system-name "dubdromic.com")
 '(erc-user-full-name "dubdromic")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(ido-everywhere t)
 '(ido-use-filename-at-point nil)
 '(menu-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
