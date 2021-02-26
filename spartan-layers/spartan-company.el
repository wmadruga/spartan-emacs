;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'company)
(add-to-list 'spartan-package-list 'company-box)

(defun spartan-company-hook ()
  (require 'company)
  (require 'company-box)

  ;; company
  (setq
   company-minimum-prefix-length 2
   company-tooltip-limit 14
   company-tooltip-align-annotations t
   company-require-match 'never
   company-global-modes '(not erc-mode message-mode help-mode gud-mode)
   company-frontends '(company-pseudo-tooltip-frontend
		       company-echo-metadata-frontend)
   company-backends '(company-capf)
   company-auto-complete nil
   company-auto-complete-chars nil
   company-dabbrev-other-buffers nil
   company-dabbrev-ignore-case nil
   company-dabbrev-downcase nil)

  ;; company-box
  (add-hook 'company-mode-hook 'company-box-mode))

(add-hook 'after-init-hook 'spartan-company-hook)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'spartan-company)
