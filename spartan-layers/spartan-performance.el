;;; spartan-performance --- Performance settings -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; https://emacs-lsp.github.io/lsp-mode/page/performance/
;; https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation

;;; Code:
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

(if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (setq comp-deferred-compilation t
          package-native-compile t)
  (message "Native complation is *not* available, lsp performance will suffer..."))

(unless (functionp 'json-serialize)
  (message "Native JSON is *not* available, lsp performance will suffer..."))

;; do not steal focus while doing async compilations
(setq warning-suppress-types '((comp)))

;; lsp-mode
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(provide 'spartan-performance)
;;; spartan-performance.el ends here
