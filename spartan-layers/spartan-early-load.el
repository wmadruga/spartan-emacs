;;; spartan-early-load --- Packages and config I need to load early -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; theme to be loaded later, via symlink

;;; Code:
(add-to-list 'spartan-package-list 'exec-path-from-shell)
(add-to-list 'spartan-package-list 'no-littering)

(add-to-list 'spartan-package-list 'doom-themes)
(add-to-list 'spartan-package-list 'doom-modeline)

(add-to-list 'spartan-package-list 'modus-themes)
(add-to-list 'spartan-package-list 'modus-vivendi-theme)
(add-to-list 'spartan-package-list 'modus-operandi-theme)

(defun spartan-setup-no-littering ()
  "Setup no-littering."
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

  (require 'no-littering)
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (recentf-mode 1))

(defun spartan-early-load-hook ()
  "Init hook."
  (exec-path-from-shell-initialize)
  (spartan-setup-no-littering))

(add-hook 'after-init-hook 'spartan-early-load-hook)

(provide 'spartan-early-load)
;;; spartan-early-load.el ends here
