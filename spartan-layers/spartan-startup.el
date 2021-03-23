;;; spartan-startup --- Startup -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(setq inhibit-startup-screen nil
      initial-major-mode 'emacs-lisp-mode
      load-prefer-newer t)

(add-hook 'after-init-hook #'(lambda ()
                               (interactive)
                               (require 'server)
                               (or (server-running-p)
                                   (server-start))))
(provide 'spartan-startup)
;;; spartan-startup.el ends here
