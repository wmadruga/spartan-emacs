;;; -*- lexical-binding: t; no-byte-compile: t; -*-

;; Miscellaneous
(add-to-list 'spartan-package-list 'no-littering)

(defun spartan-no-littering-hook ()

  (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

  (require 'no-littering)
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)

  )

(add-hook 'after-init-hook 'spartan-no-littering-hook)

(provide 'spartan-no-littering)
