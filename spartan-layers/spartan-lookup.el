;;; spartan-lookup --- Code lookup -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'dumb-jump)

(defun spartan-setup-dumbjump ()
  "Dumb-jump setup."
  (setq dumb-jump-default-project user-emacs-directory
  dumb-jump-prefer-searcher 'rg
  dumb-jump-aggressive nil
  dumb-jump-selector 'ivy)

  (global-set-key (kbd "C-c g") 'dumb-jump-go)
  (global-set-key (kbd "C-c b") 'dumb-jump-back))

(defun spartan-lookup-hook ()
  "Init hook."

  (spartan-setup-dumbjump))

  (add-hook 'after-init-hook 'spartan-lookup-hook)

  (provide 'spartan-lookup)
;;; spartan-lookup.el ends here
