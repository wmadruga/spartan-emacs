;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(add-to-list 'spartan-package-list 'org-brain)
(add-to-list 'spartan-package-list 'org-superstar)
(add-to-list 'spartan-package-list 'org-bullets)

;; TODO: Create constants for directories instead of having them spread all around

(defun spartan-org-hook ()

	;; org

	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
	(setq org-directory "~/src/2nd_brain/"
	org-ellipsis " ▼ "
	org-hide-emphasis-markers t
	org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
	'((sequence
		 "TODO(t)"
		 "NEXT(n)"
		 "STRT(s)"
		 "WAIT(x)"
		 "|"
		 "DONE(d)"
		 "CANCELLED(c)")))

	;; org capture
	(defvar +org-capture-journal-file "~/src/2nd_brain/journal.org")
	(setq org-capture-templates
	'(("j" "Journal" entry (file+olp+datetree +org-capture-journal-file) "* %U %?\n%i\n%a" :prepend t :jump-to-captured t)))

	(global-set-key (kbd "C-c o c") 'org-capture)

	;; org-agenda
	(setq
	 org-agenda-start-day "0d"
	 org-agenda-span 5
	 org-agenda-include-diary t
	 org-agenda-skip-scheduled-if-done t
	 org-agenda-skip-deadline-if-done t
	 org-agenda-files '("~/src/2nd_brain/brain/TODO-LIST.org" "~/src/2nd_brain/day.org")
	 org-agenda-use-time-grid t
	 appt-display-duration 60)

	;; org-brain
	(setq
	 org-id-locations-file-relative t
	 org-brain-path "~/src/2nd_brain/brain"
	 org-id-locations-file "~/src/2nd_brain/brain/.orgids"
	 org-brain-visualize-default-choices 'all
	 org-brain-title-max-length 12
	 org-brain-include-file-entries nil
	 org-brain-file-entries-use-title nil)

	(add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)

	(push '("b" "Brain" plain (function org-brain-goto-end)
		"* %i%?" :empty-lines 1)
	      org-capture-templates)

	(global-set-key (kbd "C-c o b") 'org-brain-goto)
	(global-set-key (kbd "C-c o a") 'org-brain-agenda)

	) ;; end of spartan-org-hook

(add-hook 'after-init-hook 'spartan-org-hook)

(provide 'spartan-org)
