;;; init.el --- Init file -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;; configuration -- uncomment desired layers => C-x C-s => M-x spartan-reconfigure

;;; Code:
(setq spartan-layers
      '(spartan-startup
        spartan-performance
        spartan-better-defaults
        spartan-binds-global
        spartan-environment ;; new : have a look!
        spartan-theme       ;; new : have a look!

        spartan-elpa-melpa ; required by layers below

        ;; stuff to be loaded as early as possible, after elpa-melpa
        spartan-early-load

        ;; spartan-kill-ring ;; consider enabling it...
        ;; spartan-webpaste  ;; have a look and consider...

        ;; Environment and what not ;;;;;;;;;;;;;;;
        spartan-dashboard
        spartan-org
        spartan-company
        spartan-ivy
        spartan-crux
        spartan-emacs-nw
        spartan-vterm

        ;; Development ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        spartan-eglot
        spartan-lookup
        spartan-flycheck
        spartan-js
        spartan-magit

        ;; Everything else ;;;;;;;;;;;;;;;;;;;;;;;;
        spartan-misc
        ))

;; spartan-layers

(add-to-list 'load-path
             (concat user-emacs-directory "spartan-layers"))

(dolist (layer spartan-layers)
  (require layer))

;; install third party packages

(with-eval-after-load 'spartan-elpa-melpa
  (spartan-package-bootstrap))

;; M-x customize

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))

;; spartan.d/

(setq spartan-lisp-d
      (concat user-emacs-directory "spartan.d"))

(defun spartan-user-local-hook ()
  "Load user files located in spartan.d directory."
  (when (file-directory-p spartan-lisp-d)
    (dolist (file (directory-files
                   spartan-lisp-d nil "^.*\.el$"))
      (load-file (concat spartan-lisp-d "/" file)))))

(add-hook 'emacs-startup-hook 'spartan-user-local-hook)

;; M-x spartan-reconfigure

(defun spartan-reconfigure ()
  "Reconfigure spartan."
  (interactive)
  (load-file user-init-file)
  (run-hooks 'after-init-hook
             'emacs-startup-hook))

;;; init.el ends here
