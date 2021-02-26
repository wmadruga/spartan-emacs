;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'js2-mode)
(add-to-list 'spartan-package-list 'js2-refactor)
(add-to-list 'spartan-package-list 'typescript-mode)
(add-to-list 'spartan-package-list 'rainbow-delimiters)

(defun spartan-js-hook ()

  (setq
   js-chain-indent t
   ;; Don't mishighlight shebang lines
   js2-skip-preprocessor-directives t
   ;; let flycheck handle this
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil
   ;; Flycheck provides these features, so disable them: conflicting with
   ;; the eslint settings.
   js2-strict-trailing-comma-warning nil
   js2-strict-missing-semi-warning nil
   ;; maximum fontification
   js2-highlight-level 3
   js2-highlight-external-variables t
   js2-idle-timer-delay 0.1)

  ;; configuration more suitable for my work environment
  (js2-refactor-mode)
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  (setq fill-column 140)
  (setq tab-width 2)

  (add-hook 'js2-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)

  ;; Netsuite SDF stuff - temeporary lib I am working on, name is likely to change
  (load-file "~/src/netsuite-mode.el/netsuite.el")
  (global-set-key (kbd "C-c n c") 'netsuite/create-project)
  (global-set-key (kbd "C-c n d") 'netsuite/deploy)
  (global-set-key (kbd "C-c n u") 'netsuite/upload-buffer)

  ) ;; end of spartan-js-hook

(add-hook 'after-init-hook 'spartan-js-hook)

(provide 'spartan-js)
