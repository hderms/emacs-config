;;paths
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/evil-leader")
(add-to-list 'load-path "~/.emacs.d/evil-org")
(add-to-list 'load-path "~/.emacs.d/surround")
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/dirtree")
(add-to-list 'load-path "~/.emacs.d/tree")
(add-to-list 'load-path "~/.emacs.d/powerline")
(add-to-list 'load-path "~/.emacs.d/evil-powerline")

(add-to-list 'load-path "~/.emacs.d/windata")
(add-to-list 'load-path "~/.emacs.d/ruby-end")

;;require
(require 'evil)
(require 'evil-leader)
(require 'evil-org)


(require 'ruby-end)
(require 'powerline)
(require 'org)
(require 'surround)
(require 'color-theme)
(require 'undo-tree)
(require 'dirtree)
(require 'package)

;
(ido-mode t)
;;theme
(load  "~/.emacs.d/themes/color-theme-molokai.el")
(powerline-default-theme)

(color-theme-molokai)

;;options
(desktop-save-mode t)
 (setq-default indent-tabs-mode nil)
(global-undo-tree-mode)
(setq undo-limit 100000)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-surround-mode 1)
(global-linum-mode 1)
(line-number-mode 1)
  (defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(setq vc-follow-symlink 'true)
(scroll-bar-mode -1)
(eval-after-load "startup" '(fset 'display-startup-echo-area-message (lambda ())))
(setq inhibit-startup-message t)

(global-font-lock-mode 1)
(auto-image-file-mode 1)
(auto-compression-mode 1)

;;evil
(global-evil-leader-mode)
(evil-leader/set-key 

"o" 'find-file
"b" 'switch-to-buffer
"m" 'compose-mail
"k" 'kill-buffer
"nt" 'dirtree
"gb" 'git-blame-mode
"ff" 'anything-git-files
"cd" 'cd
"uv" 'undo-tree-visualize
)
(evil-mode 1)

;;mail
(setq user-mail-address "dermot.haughey@rvibe.com"
              user-full-name "Dermot Haughey")

    ;;package management stuff
(add-to-list 'package-archives
'("melpa" . "http://melpa.milkbox.net/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0f0e3af1ec61d04ff92f238b165dbc6d2a7b4ade7ed9812b4ce6b075e08f49fe" default)))
 '(ede-project-directories (quote ("/home/dermot/vusion_g")))
 '(ido-everywhere t)
 '(send-mail-function (quote sendmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1B1D1E" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Anonymous Pro")))))


 ;;Dirtree stuff
(eval-after-load "tree-widget"
                   '(if (boundp 'tree-widget-themes-load-path)
                             (add-to-list 'tree-widget-themes-load-path "~/.emacs.d/")))

			     (defun ep-dirtree ()
			     (interactive)
			     (dirtree-in-buffer eproject-root t))
;;package requires
(require 'git-blame)
(require 'rinari)
(global-rinari-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '(".emacs" . emacs-lisp-mode))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(dolist (pattern '("\\.rb$" "Rakefile$" "\.rake$" "\.rxml$" "\.rjs$" ".irbrc$" "\.builder$" "\.ru$" "\.gemspec$" "Gemfile$"))
   (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))

