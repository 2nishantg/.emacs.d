(use-package flycheck
  :after general hide-mode-line
  :general
  (general-global-error
   "n"     'flycheck-next-error
   "p"     'flycheck-previous-error
   "r"     'flycheck-buffer
   "l"     'flycheck-list-errors
    )
  :hook (flycheck-error-list-mode . hide-mode-line-mode)
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  )

(provide 'my-flycheck)

(add-hook 'flycheck-error-list-mode #'hide-mode-line-mode)
