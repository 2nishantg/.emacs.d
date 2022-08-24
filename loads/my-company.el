(use-package company
  :diminish
  :bind
   ("C-i" . company-complete-common)
  :config
  (global-company-mode)
  (setq company-idle-delay nil)
)

(provide 'my-company)
