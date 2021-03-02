;;; spartan-flymake --- Flymake -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(defun spartan-flymake-hook ()
  "Init hook."
  (require 'flymake)
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

(add-hook 'after-init-hook 'spartan-flymake-hook)

(provide 'spartan-flymake)
;;; spartan-flymake.el ends here
