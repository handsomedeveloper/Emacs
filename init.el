;;package repository
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;;copy start
(defvar my-packages `(magit smex ido-ubiquitous go-mode go-autocomplete go-complete go-eldoc go-rename json-mode markdown-mode exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)  
    (package-install p)))

(require 'go-complete)
(require 'go-autocomplete)


(defun setup-go-mode()
  (go-eldoc-setup)
  (auto-complete-mode)
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (local-set-key (kbd "M-.") 'godef-jump)
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook 'setup-go-mode)
;;copy end

;;hide menu,tool and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;not display help screen
(setq inhibit-splash-screen 1)

;;display line number and hightlight current line
(global-linum-mode 1)
;;(global-hl-line-mode 1)

;;load theme
(load-theme 'wombat)

;;set default character size
(set-face-attribute 'default nil :height 180)

;;default full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;set default shell and import shell environment variable and bind shortcut F2
(setq-default explicit-shell-file-name "/usr/local/bin/bash")
(setq-default shell-file-name "/usr/local/bin/bash")
(setenv "SHELL" shell-file-name)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH"))
(global-set-key [f2] 'shell)

;;set open config file shortcut F3
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key [f3] 'open-init-file)

;;load dicretory tree plug and bind shortcut F4
(add-to-list 'load-path "/Users/SheJie/.emacs.d/plugs/neotree")
(require 'neotree)
(global-set-key [f4] 'neotree-toggle)

(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell markdown-mode json-mode go-rename go-eldoc go-complete go-autocomplete go-mode ido-ubiquitous smex magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
