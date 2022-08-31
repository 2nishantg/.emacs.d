(fringe-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(setq my-font "PragmataPro 32")

(defun my-reload-font ()
  (interactive)
  (setq default-frame-alist (cl-remove-if (lambda (x) (eq (car x) 'font)) default-frame-alist))
  (add-to-list 'default-frame-alist (list 'font  my-font))
  (set-frame-font my-font  nil t)
  )

(my-reload-font)


(use-package ef-themes 
  :config
  (load-theme 'ef-day t)
  )

(use-package hide-mode-line
  :config
  )

(use-package diminish)


(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
		hl-todo-keyword-faces
		`(("TODO"       warning bold)
		  ("FIXME"      error bold)
		  ("HACK"       font-lock-constant-face bold)
		  ("REVIEW"     font-lock-keyword-face bold)
		  ("NOTE"       success bold)
		  ("DEPRECATED" font-lock-doc-face bold))))

(provide 'my-display)
