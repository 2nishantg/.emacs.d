(use-package go-mode
  :hook
  (go-mode . eglot-ensure)  ; connect to language server when go-file is opened
  :config
  (setq gofmt-command "goimports")
  (setq gofmt-args '("-local" "nirvanatech.com"))
  )

(provide 'my-golang)
