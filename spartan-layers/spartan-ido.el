;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'amx)
(add-to-list 'spartan-package-list 'ido-completing-read+)

(defun spartan-ido-hook ()
  (require 'ido)
  (require 'ido-completing-read+)
  (require 'amx)

  (setq ido-create-new-buffer 'always
        ido-auto-merge-work-directories-length -1
        ido-enable-flex-matching t
        ido-use-filename-at-point 'guess
        ido-use-faces nil)

  (ido-mode 1)
  (ido-everywhere 1)

  (with-eval-after-load 'ido-completing-read+
    (ido-ubiquitous-mode 1))

  (with-eval-after-load 'amx
    (setq amx-ignored-command-matchers nil
          amx-show-key-bindings nil)
    (amx-mode 1)))

(add-hook 'after-init-hook 'spartan-ido-hook)

(provide 'spartan-ido)
