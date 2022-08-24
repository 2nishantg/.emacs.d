;; load evil
(use-package evil
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'isearch)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-disable-insert-state-bindings t)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode)
  (add-hook 'after-save-hook #'evil-normal-state)

  (setq evil-emacs-state-cursor '(box "purple")
	evil-insert-state-cursor '(box "sky blue")
	evil-normal-state-cursor '(box "orange")
	evil-visual-state-cursor '(box "medium sea green"))
)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init '(magit vertico consult))
  )

(use-package undo-tree
  :after evil
  :diminish undo-tree-mode
  :init
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(provide 'my-evil)
