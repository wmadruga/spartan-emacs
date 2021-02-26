;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'restart-emacs)
(add-to-list 'spartan-package-list 'ibuffer-vc)
(add-to-list 'spartan-package-list 'undo-fu)
(add-to-list 'spartan-package-list 'which-key)
(add-to-list 'spartan-package-list 'origami)

;; For when I was using with chemacs... but it seems I am transitioning to 100% my spartan fork.
;; (defun spartan-restart ()
;;   (interactive)
;;   (restart-emacs '("--with-profile" "spartan"))
;;   )

(defun couple-personal-overrides ()
  (setq
   fill-column 140
   tab-width 2
   shell-file-name "/usr/bin/zsh"
   explicit-shell-file-name "/usr/bin/zsh"))

(defun spartan-setup-movements ()
  (global-set-key (kbd "s-<right>")   'windmove-right)
  (global-set-key (kbd "s-<left>")    'windmove-left)
  (global-set-key (kbd "s-<up>")      'windmove-up)
  (global-set-key (kbd "s-<down>")    'windmove-down)
  (global-set-key (kbd "C-s-<down>")  'enlarge-window)
  (global-set-key (kbd "C-s-<up>")    'shrink-window)
  (global-set-key (kbd "C-s-<left>")  'shrink-window-horizontally)
  (global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally))

(defun spartan-misc-hook ()

  ;; configuration more suitable for my work environment
  (couple-personal-overrides)
  (spartan-setup-movements)

  ;; Some of my functions from another emacs configuration
  ;; TODO: might pull them in here if I end up sticking with spartan
  (load-file "~/src/wmad-emacs/wmad/core/wmad-fns.el")
  (global-set-key (kbd "C-c <down>") 'wmad/duplicate-line)

  ;; which-key
  (which-key-mode)

  ;; origami
  (global-origami-mode)
  (global-set-key (kbd "C-c z") 'origami-toggle-node)

  ;; Some more random keybindings...
  (global-set-key (kbd "C-z") 'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo)
  (global-set-key (kbd "C-c r") 'counsel-recentf)
  )

(add-hook 'after-init-hook 'spartan-misc-hook)

(provide 'spartan-misc)
