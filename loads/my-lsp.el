(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-lens-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-signature-render-documentation nil)
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-file-watchers nil)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (go-mode . lsp-deferred)
         )
  :config
  (general-define-key
   :states 'normal
   :keymaps 'lsp-mode-map
   "g t" 'lsp-find-type-definition
   [remap xref-find-references]  'lsp-find-references
   [remap xref-find-definitions] 'lsp-find-definition)
  (general-global-change
	"c r"    'lsp-rename
	)


  :commands (lsp lsp-deferred))

;; optionally
(use-package lsp-ui
  :after lsp
  :config
  (general-define-key
   :states 'normal
   :keymaps 'lsp-mode-map
   "g K" 'lsp-ui-doc-show)
  )

;; ;; optionally if you want to use debugger
;; 
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'my-lsp)
