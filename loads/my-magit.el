(use-package magit
  :general
  (general-global-git
    "g"    'magit-status
    "b"    'magit-blame
    )
  :config
  ;; needed for commit message buffer
  (evil-set-initial-state 'text-mode 'insert)

  )

(provide 'my-magit)
