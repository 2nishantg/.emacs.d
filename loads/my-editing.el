(use-package clean-kill-ring
  :straight (clean-kill-ring :type git :host github :repo "NicholasBHubbard/clean-kill-ring.el")
  :config
  (clean-kill-ring-mode 1)
  (setq clean-kill-ring-prevent-duplicates t)
  )

(provide 'my-editing)
