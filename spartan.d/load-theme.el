;;; load-theme --- Loads the Doom theme and modeline  -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:

(defun spartan-load-doom-theme ()
  "Load DOOM theme."
  (require 'doom-themes)
  (load-theme 'doom-one t)
  (spartan-configure-modeline))

(defun spartan-configure-modeline ()
  "Configure modeline."
  (require 'doom-modeline)
  (doom-modeline-mode 1)
  (add-hook 'after-init-hook #'doom-modeline-mode))

(defun spartan-load-modus-theme ()
  "Load Modus themes."

  (require 'modus-themes)

  (setq modus-themes-bold-constructs t
        modus-themes-mode-line '3d)

  (modus-themes-load-themes)
  (modus-themes-load-vivendi)

  (define-key global-map (kbd "<f12>") #'modus-themes-toggle))

(spartan-load-modus-theme)

;;; load-theme.el ends here
