(use-package go-mode
  :hook
  (go-mode . eglot-ensure)  ; connect to language server when go-file is opened
  )

(provide 'my-golang)
