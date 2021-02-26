;;; spartan-vterm --- vterm configuration -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; requires libvterm

;;; Code:
(add-to-list 'spartan-package-list 'vterm)

(defun spartan-vterm-hook ()
  "Init hook."
  (require 'vterm)

  (setq
   shell-file-name "/usr/bin/zsh"
   explicit-shell-file-name "/usr/bin/zsh"
   vterm-shell "zsh"
   vterm-max-scrollback 10000)

  (setenv "SHELL" shell-file-name)
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))

(add-hook 'after-init-hook 'spartan-vterm-hook)

(provide 'spartan-vterm)

;;; spartan-vterm ends here
