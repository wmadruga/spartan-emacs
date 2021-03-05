;;; spartan-eglot --- Eglot setup -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; https://github.com/joaotavora/eglot

;;; Code:
(add-to-list 'spartan-package-list 'eglot)

(defun spartan-eglot-hook ()
  "Init hook."
  (require 'eglot)

  (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))

  (define-key eglot-mode-map (kbd "M-m dd") 'eldoc)
  (define-key eglot-mode-map (kbd "M-,") 'eglot-rename)
  (define-key eglot-mode-map (kbd "M-=") 'eglot-format)
  (define-key eglot-mode-map (kbd "M-?") 'xref-find-references)
  (define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key eglot-mode-map (kbd "M-/") 'completion-at-point))

(add-hook 'after-init-hook 'spartan-eglot-hook)

(provide 'spartan-eglot)
;;; spartan-eglot ends here
