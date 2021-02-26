;;; spartan-flycheck --- Flycheck support -*- lexical-binding: t; no-byte-compile: t; -*-
;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'flycheck)

(defun spartan-flycheck-hook ()
  "Init hook."
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-temp-prefix ".flycheck")
  )

(add-hook 'after-init-hook 'spartan-flycheck-hook)
(add-hook 'prog-mode-hook 'global-flycheck-mode)

(provide 'spartan-flycheck)
;;; spartan-flycheck.el ends here
