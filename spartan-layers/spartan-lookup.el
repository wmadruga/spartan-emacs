;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'dumb-jump)

(defun spartan-lookup-hook ()

  (setq dumb-jump-default-project user-emacs-directory
	dumb-jump-prefer-searcher 'rg
	dumb-jump-aggressive nil
	dumb-jump-selector 'ivy)

  (global-set-key (kbd "C-c g") 'dumb-jump-go)
  (global-set-key (kbd "C-c b") 'dumb-jump-back)

  ) ;; end of spartan-lookup-hook

(add-hook 'after-init-hook 'spartan-lookup-hook)

(provide 'spartan-lookup)
