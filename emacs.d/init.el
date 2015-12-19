; theme
(load-file "~/.emacs.d/base16-default-dark-theme.el")
; Never show the menu bar
(menu-bar-mode -1)


; IDO mode for quick completions in minibuffer
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)

; Move between panes with the arrow keys
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

; Don't save backup files, they're annoying
(setq backup-inhibited t)
(setq auto-save-default nil)

; This is a bit janky for a lot of things, and doesn't allow manual indenting :(
; (define-key global-map (kbd "RET") 'newline-and-indent)
(setq tab-width 2)

; y or n
(defalias 'yes-or-no-p 'y-or-n-p)

; Line numbers everywhere
(global-linum-mode 1)

; electric pears
(electric-pair-mode 1)

; Will attempts Lisp
(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'back-to-indentation)
