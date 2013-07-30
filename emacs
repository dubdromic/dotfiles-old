;; hide startup message and bars
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; .emacs.d
(add-to-list 'load-path user-emacs-directory)

;; colors
(require 'tomorrow-night-theme)

;; write backups to a separate file
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		(concat user-emacs-directory "backups")))))

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
      '(rinari autopair switch-window el-get))

(el-get 'sync my-el-get-packages)

;; org mode!

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)

;; various extensions

(require 'rinari)
(require 'magit)
(require 'autopair)
(require 'switch-window)

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
 '(ido-everywhere t)
 '(ido-use-filename-at-point nil)
 '(haskell-mode-hook '(turn-on-haskell-indentation))
)
