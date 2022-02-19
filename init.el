;;; package --- Summary
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
;;; Code:
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(helm-completion-style (quote helm))
 '(helm-dictionary-browser-function (quote browse-url-firefox))
 '(helm-dictionary-database "/usr/bin/youdao-dict")
 '(helm-dictionary-online-dicts
   (quote
    (("youdao" . "http://dict.youdao.com/search?q=%s&ue=utf8")
     ("iciba" . "http://www.iciba.com/word?w=%s"))))
 '(ivy-mode t)
 '(package-selected-packages
   (quote
    (helm-dictionary ace-jump-mode deferred epc helm-descbinds smart-mode-line youdao-dictionary helm-firefox sr-speedbar ztree-dir ztree-diff dashboard good-scrll smart-region good-scroll ace-window pdf-tools dtrt-indent ws-butler function-args auto-complete-clang which-key helm-xref ag emms helm-gtags helm-ls-git helm-ls-hg duplicate-thing popwin highlight-symbol highlight-numbers nyan-mode flycheck magit diff-hl ztree recentf-ext treemacs-projectile ibuffer-vc clean-aindent-mode smartparens yasnippet undo-tree volatile-highlights helm-projectile expand-region imenu-anywhere helm use-package monokai-theme company ggtags)))
 '(sr-speedbar-default-width 10)
 '(sr-speedbar-max-width 40)
 '(wg-first-wg-name ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'saveplace)
(require 'popwin)
(require 'use-package)
(require 'emms-setup)
(require 'function-args)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
(show-paren-mode 1)
(emms-default-players)
(fa-config-default)
(global-auto-revert-mode t)
(load-theme 'monokai t)
(semantic-mode t)
(delete-selection-mode t)

(setq inhibit-splash-screen 1)
(setq inhibit-startup-message -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default dired-dwim-target 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default save-place t)

(use-package emms
  :ensure t
  :init
  (setq-default emms-source-file-default-directory "~/Music/CloudMusic/")
  :config
  (emms-all))

(use-package ace-window
  :ensure t
  :bind
  ("C-x o" . 'ace-window))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-banner-logo-title "Howin' Emacs!")
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-startup-banner 'official)
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  :bind
  ("C-M-k" . sp-kill-sexp)
  ("C-M-c" . sp-copy-sexp))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package duplicate-thing
  :ensure t
  :bind
  (("C--" . 'duplicate-thing)))

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . 'er/expand-region)))

(use-package ibuffer-vc
  :ensure t
  :bind
  ("C-x C-b" . 'ibuffer))

(use-package helm
  :ensure t
  :init
  (setq-default helm-buffers-fuzzy-matching t)
  :bind
  ("M-x" . 'helm-M-x)
  ("C-x r b" . 'helm-filtered-bookmarks)
  ("C-x C-f" . 'helm-find-files)
  ("M-y" . 'helm-show-kill-ring)
  ("C-x b" . 'helm-mini)
  ("C-x c C-SPC" . 'helm-mark-ring)
  ("C-x C-d" . 'helm-browse-project)
  ("C-x c p" . 'helm-projects-history)
  ("C-j" . 'helm-gtags-select)
  ("M-." . 'helm-gtags-dwim)
  ("M-," . 'helm-gtags-pop-stack)
  ("C-z" . 'helm-descbinds)
  :config
  (helm-mode))


(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  :bind
  (:map projectile-mode-map
        ("C-c p" . projectile-command-map))
  :config
  (projectile-mode))

(use-package recentf-ext
  :ensure t)

(use-package flycheck
  :ensure t
  :hook
  (after-init . global-flycheck-mode))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode))

(use-package highlight-numbers
  :ensure t
  :hook
  (prog-mode . highlight-numbers-mode))

(use-package highlight-symbol
  :ensure t
  :bind
  ("M-p" . 'highlight-symbol-prev)
  ("M-n" . 'highlight-symbol-next)
  :hook
  (prog-mode . highlight-symbol-mode))

(use-package sr-speedbar
  :ensure t
  :init
  (setq sr-speedbar-right-side nil)
  (setq sr-speedbar-width 2))

(use-package ws-butler
  :ensure t
  :hook
  (c-mode-common . ws-butler-mode))

(use-package youdao-dictionary
  :ensure t
  :defer 2
  :config
  (setq-default url-automatic-caching t)
  :bind
  ("C-x y s" . youdao-dictionary-search-at-point-posframe)
  ("C-x y p" . youdao-dictionary-play-voice-at-point)
  ("C-x y r" . youdao-dictionary-search-and-replace)
  ("C-x y i" . youdao-dictionary-search-from-input))

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(use-package ctable
  :ensure t
  :load-path "~/.emacs.d/site-lisp/emacs-ctable")

(use-package ace-jump-mode
  :ensure t
  :init
  (define-key global-map (kbd "C-x SPC") 'ace-jump-mode))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . 'magit-status))

(use-package clean-aindent-mode
  :ensure t
  :hook
  (prog-mode . clean-aindent-mode))

(use-package diff-hl
  :ensure t
  :hook
  (dired-mode . diff-hl-dir-mode)
  :config
  (global-diff-hl-mode))

(use-package dtrt-indent
  :ensure t
  :config
  (dtrt-indent-mode))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode))

(provide 'init)
;;; init.el ends here
