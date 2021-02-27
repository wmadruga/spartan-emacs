;;; load-doom-theme --- Loads the Doom theme and modeline  -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:

;;; Code:
(require 'doom-themes)
(load-theme 'doom-one t)

(require 'doom-modeline)
(doom-modeline-mode 1)
(add-hook 'after-init-hook #'doom-modeline-mode)

;;; load-doom-theme.el ends here
