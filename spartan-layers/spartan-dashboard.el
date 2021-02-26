;;; spartan-dashboard --- Dashboard setup -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(add-to-list 'spartan-package-list 'dashboard)

(defun spartan-dashboard-hook ()
  "Init hook."
  (with-eval-after-load 'spartan-startup
    (setq inhibit-startup-screen t))

  (require 'dashboard)

  (setq dashboard-center-content t)

  (dashboard-setup-startup-hook)

  (setq dashboard-startup-banner 'logo)

  (setq dashboard-banner-logo-title nil)

  (setq dashboard-page-separator "\n\n")

  (setq dashboard-items '((recents  . 10)
                          (agenda . 20)))

  (setq dashboard-set-init-info t)

  (setq dashboard-footer-messages '("\"So that we may always have something to offer\"")))

(add-hook 'after-init-hook 'spartan-dashboard-hook)

(provide 'spartan-dashboard)
;;; spartan-dashboard.el ends here
