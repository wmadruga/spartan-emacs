;;; spartan-early-load --- Packages and config I need to load early -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; theme to be loaded later, via symlink

;;; Code:

(defun spartan-early-load-hook ()
  "Init hook."
  (exec-path-from-shell-initialize)
  (spartan-setup-no-littering))

(add-hook 'after-init-hook 'spartan-early-load-hook)

(provide 'spartan-early-load)
;;; spartan-early-load.el ends here
