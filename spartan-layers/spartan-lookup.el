;;; spartan-lookup --- Code lookup -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'dumb-jump)
(add-to-list 'spartan-package-list 'lsp-mode)
(add-to-list 'spartan-package-list 'lsp-ui)
(add-to-list 'spartan-package-list 'lsp-ivy)

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

  (spartan-setup-dumbjump)


  (setq lsp-idle-delay 0.500 ;; fine-tune LSP delay
        lsp-log-io nil))      ;; turn-off lsp logs

(add-hook 'after-init-hook 'spartan-lookup-hook)

(provide 'spartan-lookup)
;;; spartan-lookup.el ends here
