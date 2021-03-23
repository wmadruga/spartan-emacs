;;; spartan-environment.el --- Environment settings -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; Explicitly set an Emacs environment as desired.
;; NO MORE editing .bash_profile or whatever or messing with packages like `exec-path-from-shell' !

;;; Code:

(defun maybe-install-early-needed-packages ()
  "MAYBE install packages needed early in the setup."
  (add-to-list 'spartan-package-list 'no-littering)
  (with-eval-after-load 'spartan-elpa-melpa
    (spartan-package-bootstrap)))

(defun spartan-setup-no-littering ()
  "Setup no-littering."
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq backup-directory-alist `(("." . ,(no-littering-expand-var-file-name "backups"))))

  (require 'no-littering)
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)
  (recentf-mode 1))

(maybe-install-early-needed-packages)
(spartan-setup-no-littering)

(require 'subr-x)

;; if EDITOR is not set already, set it.
(or (getenv "EDITOR")
    (progn
      (setenv "EDITOR" "emacsclient")
      (setenv "VISUAL" (getenv "EDITOR"))))

;; if PAGER is not set already, set it
(or (getenv "PAGER")
    (setenv "PAGER" "cat"))

;; 'PATH' modifications

(setq spartan-path-insert '(
                            "~/bin"
                            "~/.local/bin"
                            "~/.nix-profile/bin"
                            "~/.deno/bin"
                            "~/.config/guix/usr/local/sbin"
                            "~/devenv/apache-maven-3.6.1/bin"
                            "~/.npm-packages/bin"
                            ))

(setq spartan-path-append '(
                            ;; "~/Put/To/End/Of/PATH"
                            ))

;; SET matching exec-path and 'PATH' values with inserts/appends

(dolist (item spartan-path-insert)
  (add-to-list 'exec-path item))

(dolist (item spartan-path-append)
  (add-to-list 'exec-path item t))

(setenv "PATH" (string-trim-right (string-join exec-path ":") ":$"))

(provide 'spartan-environment)
;;; spartan-environment.el ends here
