;;; spartan-misc --- Miscellaneous-*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'restart-emacs)
(add-to-list 'spartan-package-list 'ibuffer-vc)
(add-to-list 'spartan-package-list 'undo-fu)
(add-to-list 'spartan-package-list 'which-key)
(add-to-list 'spartan-package-list 'origami)
(add-to-list 'spartan-package-list 'helpful)
(add-to-list 'spartan-package-list 'ws-butler)
(add-to-list 'spartan-package-list 'dired-single)
(add-to-list 'spartan-package-list 'hnreader)

;; (defun spartan-restart ()
;;   "For when I was using with chemacs... but it seems I am transitioning to 100% my spartan fork."
;;   (interactive)
;;   (restart-emacs '("--with-profile" "spartan")))

(defun spartan-setup-window-placement ()
  "Setup window placement rules."

  (setq display-buffer-alist
        ;; display the window for the async shell command output at the bottom, small height.
        '(("\\.*Async Shell Command.*"
           (display-buffer-at-bottom)
           (window-height . 0.1)
           ))))

(defun couple-personal-overrides ()
  "Couple of personal overrides."
  (setq-default fill-column 140
                tab-width 2
                indent-tabs-mode nil)

  (setq use-dialog-box t
        undo-limit 80000000
        make-backup-files nil
        create-lockfiles nil
        recentf-max-saved-items 50)

  (global-display-line-numbers-mode t)

  (put 'narrow-to-region 'disabled nil)

  (delete-selection-mode 1)

  (dolist (mode '(org-mode-hook
                  shell-mode-hook
                  eshell-mode-hook
                  vterm-mode-hook
                  term-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

  (spartan-setup-window-placement))

(defun spartan-setup-movements ()
  "Setup some window movements."
  (global-set-key (kbd "s-<right>")   'windmove-right)
  (global-set-key (kbd "s-<left>")    'windmove-left)
  (global-set-key (kbd "s-<up>")      'windmove-up)
  (global-set-key (kbd "s-<down>")    'windmove-down)
  (global-set-key (kbd "C-s-<down>")  'enlarge-window)
  (global-set-key (kbd "C-s-<up>")    'shrink-window)
  (global-set-key (kbd "C-s-<left>")  'shrink-window-horizontally)
  (global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally))

(defun spartan-setup-dired-single ()
  "Dired-single setup."
  (require 'dired)
  (define-key dired-mode-map [remap dired-find-file]
    'dired-single-buffer)
  (define-key dired-mode-map [remap dired-mouse-find-file-other-window]
    'dired-single-buffer-mouse)
  (define-key dired-mode-map [remap dired-up-directory]
    'dired-single-up-directory))

(defun spartan-setup-ibuffer-vc ()
  "Setup ibuffer-vc."
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

(defun spartan-misc-hook ()
  "Configuration a bit more suitable for my work environment."

  (couple-personal-overrides)
  (spartan-setup-movements)
  (spartan-setup-dired-single)
  (spartan-setup-ibuffer-vc)

  ;; Some of my functions from another emacs configuration
  ;; TODO: might pull them in here if I end up sticking with spartan
  (load-file "~/src/wmad-emacs/wmad/core/wmad-fns.el")
  (global-set-key (kbd "C-c <down>") 'wmad/duplicate-line)

  ;; enable which-key
  (which-key-mode)

  ;; enable origami
  (global-origami-mode)
  (global-set-key (kbd "C-c z") 'origami-toggle-node)

  ;; Some more keybindings...
  (global-set-key (kbd "C-z") 'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo)
  (global-set-key (kbd "C-c r") 'counsel-recentf)
  (global-set-key (kbd "C-h f")   #'helpful-callable)
  (global-set-key (kbd "C-h v")   #'helpful-variable)
  (global-set-key (kbd "C-h k")   #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F")   #'helpful-function)
  (global-set-key (kbd "C-h C")   #'helpful-command))

(add-hook 'after-init-hook 'spartan-misc-hook)
(add-hook 'text-mode-hook 'ws-butler-mode)
(add-hook 'prog-mode-hook 'ws-butler-mode)

(provide 'spartan-misc)
;;; spartan-misc.el ends here
