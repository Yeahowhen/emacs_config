;;; package --- Summary
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives
	         '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(package-initialize)

;;; Code:

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
 '(lsp-keymap-prefix "C-c l")
 '(org-agenda-files nil)
 '(package-selected-packages
   '(helm-flymake helm-fuzzy helm-fuzzy-find helm-google helm-org helm-osx-app theme-magic paradox nyan-mode doom-themes doom-modeline emojify mode-icons auto-package-update howdoi auctex-latexmk company-auctex auctex pdf-view-restore let-alist hexo ripgrep multi-term restart-emacs helm-system-packages dumb-jump lsp-pyright flycheck-pos-tip company-quickhelp apheleia json-rpc consult-eglot eglot lsp-treemacs aggresive-indent indent-guide clipmon move-dup zzz-to-char fix-word pangu-spacing crux multiple-cursors dimmer focus beacon highlight-parentheses color-identifiers-mode goto-line-preview ctrlf helm-swoop centaur-tabs zoom workgroups2 smooth-scroll sublimity ace-popup-menu helpful treemacs-all-the-icons treemacs yasnippet-snippets mwim google google-this rainbow-mode rainbow-delimiters posframe exec-path-from-shell helm-flycheck helm-company helm-lsp org-roam fuzzy auto-compelete org-edit-latex ctable helm-dictionary ace-jump-mode deferred epc helm-descbinds youdao-dictionary helm-firefox ztree-dir ztree-diff dashboard good-scrll smart-region good-scroll ace-window pdf-tools dtrt-indent ws-butler function-args auto-complete-clang which-key helm-xref ag helm-gtags helm-ls-git helm-ls-hg duplicate-thing popwin highlight-symbol highlight-numbers flycheck magit diff-hl ztree recentf-ext treemacs-projectile ibuffer-vc clean-aindent-mode smartparens yasnippet undo-tree volatile-highlights helm-projectile expand-region imenu-anywhere helm use-package company ggtags))
 '(paradox-github-token t)
 '(python-indent-offset 4)
 '(python-shell-completion-native-enable nil)
 '(python-shell-exec-path '("/usr/bin"))
 '(symon-monitors
   '(symon-darwin-memory-monitor symon-darwin-cpu-monitor symon-darwin-network-rx-monitor symon-darwin-network-tx-monitor))
 '(symon-sparkline-type 'plain)
 '(warning-suppress-types '((use-package)))
 '(wg-first-wg-name ""))

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(defalias 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(show-paren-mode 1)
(menu-bar-mode -1)
(fa-config-default)
(global-auto-revert-mode t)
(semantic-mode t)
(delete-selection-mode t)

(setq inhibit-splash-screen 1)
(setq load-prefer-newer t)
(setq inhibit-startup-message -1)
(setq make-backup-files nil)
(setq byte-compile-warnings '(cl-function))
(setq-default dired-dwim-target 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

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

(require 'use-package)

(use-package exec-path-from-shell
  :ensure t
  :hook
  (after-init . exec-path-from-shell-initialize))

(use-package ace-window
  :ensure t
  :bind
  ("C-x o" . ace-window))

(use-package saveplace
  :ensure t
  :config
  (save-place-mode))

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
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)
                          (bookmarks . 5)))
  (setq dashboard-set-navigator t)
  (setq dashboard-footer nil)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  :config
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

(use-package company-quickhelp
  :ensure t
  :hook
  (company-mode . company-quickhelp-mode))

(use-package duplicate-thing
  :ensure t
  :bind
  ("C--" . duplicate-thing))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

(use-package ibuffer-vc
  :ensure t
  :bind
  ("C-x C-b" . ibuffer))

(use-package helm
  :ensure t
  :init
  (setq-default helm-buffers-fuzzy-matching t)
  :bind
  (("M-x" . helm-M-x)
   ("C-x r b" . helm-filtered-bookmarks)
   ("C-x C-f" . helm-find-files)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini)
   ("C-x c C-SPC" . helm-mark-ring)
   ("C-x C-d" . helm-browse-project)
   ("C-x c p" . helm-projects-history)
   ("C-j" . helm-gtags-select)
   ("C-z" . helm-descbinds))
  :config
  (helm-mode))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode))

(use-package recentf-ext
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

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

(use-package rainbow-mode
  :ensure t
  :config
  (rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package ws-butler
  :ensure t
  :hook
  (prog-mode . ws-butler-mode))

(use-package youdao-dictionary
  :ensure t
  :defer 2
  :config
  (setq-default url-automatic-caching t)
  :bind
  (("C-c y s" . youdao-dictionary-search-at-point-posframe)
   ("C-c y p" . youdao-dictionary-play-voice-at-point)
   ("C-c y r" . youdao-dictionary-search-and-replace)
   ("C-c y i" . youdao-dictionary-search-from-input)))

(use-package good-scroll
  :ensure t
  :config
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

(use-package eglot
  :ensure t
  :hook
  ((c-mode . eglot-ensure)
   (sh-mode . eglot-ensure)
   (latex-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   (cmake-mode . eglot-ensure)))

(use-package helm-lsp
  :ensure t
  :bind
  ("C-M-." . helm-lsp-workspace-symbol))

(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable)
  :hook
  (python-mode . elpy-mode))

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (("C-c t" . treemacs)
   ("C-c w" . treemacs-select-window))
  :config
  (treemacs-follow-mode))

(use-package helpful
  :ensure t
  :bind
  (("C-h c" . helpful-callable)
   ("C-h f" . helpful-function)
   ("C-h k" . helpful-key)
   ("C-h a" . helpful-command)
   ("C-h m" . helpful-macro)
   ("C-h s" . helpful-symbol)
   ("C-c C-d" . helpful-at-point)))

(use-package popwin
  :ensure t
  :config
  (popwin-mode))

(use-package ace-popup-menu
  :ensure t
  :config
  (ace-popup-menu-mode))

(use-package workgroups2
  :ensure t
  :init
  (setq wg-prefix-key "C-c z")
  :config
  (workgroups-mode t))

(use-package zoom
  :ensure t
  :init
  (setq zoom-size '(0.618 0.618))
  :bind
  ("C-x +" . zoom)
  :config
  (zoom-mode))

(use-package windmove
  :ensure t
  :bind
  ("C-c <left>" . windmove-left)
  ("C-c <right>" . windmove-right)
  ("C-c <down>" . windmove-down)
  ("C-c <up>" . windmove-up)
  :config
  (windmove-mode))

(use-package centaur-tabs
  :ensure t
  :init
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 25)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-plain-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-close-button nil)
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "M")
  (setq centaur-tabs-enable-key-bindings t)
  :hook
  (dired-mode . centaur-tabs-local-mode)
  :config
  (centaur-tabs-mode))

(use-package helm-swoop
  :ensure t
  :bind
  ("M-i" . helm-swoop))

(use-package ctrlf
  :ensure t
  :bind
  (("C-s" . ctrlf-forward-default)
   ("C-r" . ctrlf-backward-default)
   ("C-M-s" . ctrlf-forward-alternate)
   ("C-M-r" . ctrlf-backward-alternate)
   ("M-s _" . ctrlf-forward-symbol)
   ("M-s ." . ctrlf-forward-symbol-at-point))
  :config
  (ctrlf-mode))

(use-package goto-line-preview
  :ensure t
  :bind
  ("M-g g" . goto-line-preview))

(use-package color-identifiers-mode
  :ensure t
  :hook
  (after-init . color-identifiers-mode))

(use-package highlight-parentheses
  :ensure t
  :config
  (global-highlight-parentheses-mode))

(use-package beacon
  :ensure t
  :config
  (beacon-mode))

(use-package focus
  :ensure t)

(use-package dimmer
  :ensure t
  :init
  :config
  (dimmer-mode))

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-<" . mc/mark-previous-like-this)
   ("C->" . mc/mark-next-like-this)
   ("C-c C-<" . mc/mark-all-like-this)))

(use-package pangu-spacing
  :ensure t
  :init
  (setq pangu-spacing-real-insert-separtor t)
  :config
  (pangu-spacing-mode))

(use-package fix-word
  :ensure t
  :bind
  ("M-u" . fix-word-upcase)
  ("M-l" . fix-word-downcase)
  ("M-c" . fix-word-capitalize))

(use-package zzz-to-char
  :ensure t
  :bind
  ("M-z" . zzz-to-char))

(use-package move-dup
  :ensure t
  :config
  (global-move-dup-mode))

(use-package crux
  :ensure t
  :bind
  ("C-k" . crux-smart-kill-line)
  ("M-k" . crux-kill-whole-line)
  ("C-u" . crux-kill-line-backwards)
  ("C-j" . crux-top-join-line)
  ("C-M-t" . crux-visit-term-buffer)
  ("C-o" . crux-smart-open-line)
  ("M-o" . crux-smart-open-line-above))

(use-package clipmon
  :ensure t
  :config
  (clipmon-mode))

(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

(use-package ggtags
  :ensure t)

(use-package apheleia
  :ensure t
  :config
  (apheleia-mode))

(use-package lsp-treemacs
  :ensure t
  :config
  (lsp-treemacs-sync-mode))

(use-package dumb-jump
  :ensure t
  :hook
  (xref-backend-functions . dumb-jump-xref-activate))

(use-package multi-term
  :ensure t
  :init
  (setq multi-term-program "/bin/zsh"))

(use-package hexo
  :ensure t
  :config
  (hexo "~/blog"))

(use-package pdf-tools
  :ensure t
  :init
  (setq pdf-view-use-scaling t))

(use-package pdf-view-restore
  :ensure t
  :after pdf-tools
  :hook
  (pdf-view-mode . pdf-view-restore-mode))

(use-package auto-package-update
  :ensure t
  :config
  (auto-package-update-maybe))

(use-package mode-icons
  :ensure t
  :init
  (setq mode-icons-change-mode-name nil)
  :config
  (mode-icons-mode))

(use-package emojify
  :ensure t
  :hook
  (after-init . global-emojify-mode))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (setq doom-themes-treemacs-theme "doom-atom")
  :config
  (load-theme 'doom-molokai t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package nyan-mode
  :ensure t
  :init
  (setq nyan-animate-nyancat t)
  :config
  (nyan-mode))

(use-package paradox
  :ensure t
  :init
  (paradox-enable))

(use-package theme-magic
  :ensure t
  :config
  (theme-magic-export-theme-mode))

(provide 'init)

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
