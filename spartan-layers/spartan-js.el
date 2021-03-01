;;; spartan-js --- Javascript support -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'js2-mode)
(add-to-list 'spartan-package-list 'js2-refactor)
(add-to-list 'spartan-package-list 'typescript-mode)
(add-to-list 'spartan-package-list 'rainbow-delimiters)
(add-to-list 'spartan-package-list 'fill-column-indicator)

(defun spartan-js-config-defaults ()
  "Overriding defaults."

  (setq
   js-chain-indent t
   js2-skip-preprocessor-directives t
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil
   js2-strict-trailing-comma-warning nil
   js2-strict-missing-semi-warning nil
   js2-highlight-level 3
   js2-highlight-external-variables t
   js2-idle-timer-delay 0.1)

  (setq-default
   tab-width 2
   indent-tabs-mode nil
   fill-column 140
   js2-basic-offset 2
   js-indent-level 2))

(defun spartan-js-flycheck ()
  "Setup flycheck."
  ;; disable jshint
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)
      '(json-jsonlist)))
  ;; enable eslint
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

(defun spartan-js-sdfcli ()
  "Netsuite SDFCLI wrapper - temporary lib I am working on, name is likely to change."
  (load-file "~/src/netsuite-mode.el/netsuite.el")
  (global-set-key (kbd "C-c n c") 'netsuite/create-project)
  (global-set-key (kbd "C-c n d") 'netsuite/deploy)
  (global-set-key (kbd "C-c n u") 'netsuite/upload-buffer))

(defun spartan-js-hook ()
  "Init hook."
  (require 'flycheck)
  (require 'rainbow-delimiters)
  (require 'fill-column-indicator)

  (spartan-js-config-defaults)
  (spartan-js-flycheck)
  (spartan-js-sdfcli)

  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  (add-hook 'js2-mode-hook 'show-paren-mode)
  (add-hook 'js2-mode-hook 'fci-mode))

(add-hook 'after-init-hook 'spartan-js-hook)

(provide 'spartan-js)
;;; spartan-js.el ends here
