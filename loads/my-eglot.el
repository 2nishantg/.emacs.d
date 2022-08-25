(use-package eglot
  :config
  (general-define-key
   :states 'normal
   "g t" 'eglot-find-typeDefinition)
  )

(provide 'my-eglot)
