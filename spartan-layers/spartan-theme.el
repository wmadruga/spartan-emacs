;;; spartan-theme --- Describe theme packages  -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; Describe theme packages but does not load.  Loading happens later on, see init.el.

;;; Code:
(add-to-list 'spartan-package-list 'doom-themes)
(add-to-list 'spartan-package-list 'doom-modeline)
;; selected doom theme to be loaded later, via symlink

(provide 'spartan-theme)
;;; spartan-theme.el ends here
