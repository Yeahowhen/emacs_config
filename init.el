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

(exec-path-from-shell-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(exec-path
   '("/Library/TeX/texbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-arm64-12" "/Applications/Emacs.app/Contents/MacOS/libexec-arm64-12" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/opt/homebrew/bin"))
 '(helm-completion-style 'helm)
 '(helm-dictionary-browser-function 'browse-url-firefox)
 '(helm-dictionary-database "/usr/bin/youdao-dict")
 '(helm-dictionary-online-dicts
   '(("youdao" . "http://dict.youdao.com/search?q=%s&ue=utf8")
     ("iciba" . "http://www.iciba.com/word?w=%s")))
 '(ivy-mode t)
 '(lsp-keymap-prefix "C-c l" t)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(swiper-helm yasnippet-snippets neotree mwim google google-this rainbow-mode rainbow-delimiters posframe exec-path-from-shell helm-flycheck helm-company lsp-pyright helm-lsp lsp-mode org-roam fuzzy auto-compelete org-edit-latex ctable helm-dictionary ace-jump-mode deferred epc helm-descbinds smart-mode-line youdao-dictionary helm-firefox sr-speedbar ztree-dir ztree-diff dashboard good-scrll smart-region good-scroll ace-window pdf-tools dtrt-indent ws-butler function-args auto-complete-clang which-key helm-xref ag helm-gtags helm-ls-git helm-ls-hg duplicate-thing popwin highlight-symbol highlight-numbers nyan-mode flycheck magit diff-hl ztree recentf-ext treemacs-projectile ibuffer-vc clean-aindent-mode smartparens yasnippet undo-tree volatile-highlights helm-projectile expand-region imenu-anywhere helm use-package monokai-theme company ggtags))
 '(sr-speedbar-default-width 10)
 '(sr-speedbar-max-width 40)
 '(warning-suppress-types '((use-package)))
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
(require 'function-args)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(show-paren-mode 1)
(menu-bar-mode -1)
(fa-config-default)
(global-auto-revert-mode t)
(load-theme 'monokai t)
(semantic-mode t)
(delete-selection-mode t)
(rainbow-mode t)

(setq inhibit-splash-screen 1)
(setq inhibit-startup-message -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default dired-dwim-target 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default save-place t)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (python . t)
   (shell . t)
   (latex . t)
   (plantuml . t)))

(global-set-key (kbd "C-c s") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(use-package ace-window
  :ensure t
  :bind
  ("C-x o" . 'ace-window))

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

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package which-key
  :ensure t
  :config
  (which-key-setup-minibuffer)
  (which-key-mode))

(use-package smartparens
  :ensure t
  :bind
  ("C-M-k" . sp-kill-sexp)
  ("C-M-c" . sp-copy-sexp)
  :init
  (smartparens-global-mode))

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
  ("C--" . 'duplicate-thing))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . 'er/expand-region))

(use-package ibuffer-vc
  :ensure t
  :bind
  ("C-x C-b" . 'ibuffer))

(use-package helm
  :ensure t
  :init
  (setq-default helm-buffers-fuzzy-matching t)
  :bind
  (("M-x" . 'helm-M-x)
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
  ("C-z" . 'helm-descbinds))
  :config
  (helm-mode))

(use-package swiper
  :ensure t
  :bind
  (("C-s" . 'swiper-isearch)
   ("C-r" . 'swiper-isearch-backward)))

(use-package swiper-helm
  :ensure t
  :bind
  ("C-M-s" . 'swiper-helm))
   
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
  :init
  (global-flycheck-mode))

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

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

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
  ("C-c y s" . youdao-dictionary-search-at-point-posframe)
  ("C-c y p" . youdao-dictionary-play-voice-at-point)
  ("C-c y r" . youdao-dictionary-search-and-replace)
  ("C-c y i" . youdao-dictionary-search-from-input))

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(use-package good-scroll
  :ensure t
  :init
  (good-scroll-mode))

(use-package ctable
  :ensure t
  :load-path "~/.emacs.d/site-lisp/emacs-ctable")

(use-package ace-jump-mode
  :ensure t
  :bind
  ("C-c SPC" . 'ace-jump-mode))

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

(use-package google-this
  :ensure t
  :config
  (google-this-mode))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/RoamNotes")
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-enable))

(use-package lsp-mode
  :ensure t
  :hook
  ((c-mode . lsp)
   (latex-mode . lsp)
   (c++-mode . lsp)
   (cmake-mode . lsp)
   (python-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :config
  ((setq lsp-keymap-prefix "C-c l")
   (setq gc-cons-threshold 100000000)
   (setq read-process-output-max (* 2014 1024)))
  :commands
  lsp)

(use-package helm-lsp
  :ensure t
  :commands
  helm-lsp-workspace-symbol)

(use-package neotree
  :ensure t
  :bind
  ("C-c t" . 'neotree-toggle)
  :config
  (setq neo-theme 'arrow))

(provide 'init)
;;; init.el ends here
