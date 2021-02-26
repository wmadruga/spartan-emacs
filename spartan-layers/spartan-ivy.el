;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'ivy)
(add-to-list 'spartan-package-list 'ivy-posframe)
(add-to-list 'spartan-package-list 'counsel)
(add-to-list 'spartan-package-list 'swiper)

(defun spartan-ivy-hook ()
  (require 'ivy)
  (require 'counsel nil t) ;; load as early as possible
  (require 'ivy-posframe)
  (require 'swiper)

  ;; configuring ivy  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (ivy-mode 1)
  (setq ivy-sort-max-size 7500)

  (setq ivy-height 17
	ivy-wrap t
	ivy-fixed-height-minibuffer t
	ivy-read-action-function #'ivy-hydra-read-action
	ivy-read-action-format-function #'ivy-read-action-format-columns
	projectile-completion-system 'ivy
	ivy-use-virtual-buffers nil
	ivy-virtual-abbreviate 'full
	ivy-on-del-error-function #'ignore
	ivy-use-selectable-prompt t
	ivy-initial-inputs-alist nil)

  ;; configuring counsel  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (global-set-key (kbd "C-x b") 'counsel-switch-buffer)
  (global-set-key (kbd "C-h f") 'counsel-describe-function)
  (global-set-key (kbd "C-h v") 'counsel-describe-variable)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)

  (setq counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)")

  ;; configuring ivy-posframe ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq ivy-fixed-height-minibuffer nil
	ivy-posframe-border-width 10
	ivy-posframe-parameters
	`((min-width . 90)
	  (min-height . ,ivy-height)))

  (setq ivy-posframe-display-functions-alist
	'((swiper                     . ivy-posframe-display-at-window-center)
	  (complete-symbol            . ivy-posframe-display-at-window-center)
	  (counsel-M-x                . ivy-posframe-display-at-window-center)
	  (counsel-describe-function  . ivy-posframe-display-at-window-center)
	  (counsel-describe-variable  . ivy-posframe-display-at-window-center)
	  (counsel-find-file          . ivy-posframe-display-at-window-center)
	  (counsel-recentf            . ivy-posframe-display-at-window-center)
	  (project-switch-project     . ivy-posframe-display-at-window-center)
	  (project-find-file          . ivy-posframe-display-at-window-center)
	  (org-brain-goto             . ivy-posframe-display-at-window-center)
	  (dumb-jump-go               . ivy-posframe-display-at-window-center)
	  (ivy-switch-buffer          . ivy-posframe-display-at-window-center)
	  (nil                        . ivy-posframe-display))
	ivy-posframe-height-alist
	'((swiper . 20)
	  (dmenu . 20)
	  (t . 10)))

  (ivy-posframe-mode 1) ; 1 enables posframe-mode, 0 disables it.


  ;; configuring swiper  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq swiper-action-recenter t)
  (global-set-key (kbd "C-s") 'swiper)

  ) ;; end of spartan-ivy-hook

(add-hook 'after-init-hook 'spartan-ivy-hook)

(provide 'spartan-ivy)
