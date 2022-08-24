;; See https://www.reddit.com/r/emacs/comments/des3cl/comment/f2yw45k/?context=3
(defmacro general-global-menu-definer (def infix-key &rest body)
  "Create a definer named general-global-DEF wrapping global-definer.
The prefix map is named 'my-DEF-map'."
  `(progn
     (general-create-definer ,(intern (concat "general-global-" def))
       :wrapping global-definer
       :prefix-map (quote ,(intern (concat "my-" def "-map")))
       :infix ,infix-key
       :wk-full-keys nil
       "" '(:ignore t :which-key ,def))
     (,(intern (concat "general-global-" def))
      ,@body)))

(use-package general
  :demand t
  :config
  (general-override-mode)
  (general-auto-unbind-keys)

  (general-define-key
   :states 'normal
   "escape" 'keyboard-quit
   "g D" 'xref-find-references
   "g d" 'xref-find-definitions)

  (global-unset-key (kbd "S-SPC"))
  (general-create-definer global-definer
    :keymaps 'override
    :states '(insert emacs normal hybrid motion visual operator)
    :prefix "SPC"
    :non-normal-prefix "S-SPC")

  (global-definer
    "!"   'shell-command
    "TAB" '(lambda () (interactive) (switch-to-buffer nil))
    "x" '(lambda () (interactive) (switch-to-buffer "*scratch*"))
    "o" 'other-window
    "SPC" 'other-window
    ":"   'execute-extended-command)

  (general-global-menu-definer
   "project" "p"
    "f"    'project-find-file
   )

  (general-global-menu-definer
   "search" "s")

  (general-global-menu-definer
   "error" "e")

  (general-global-menu-definer
   "git" "g")

  (general-global-menu-definer
   "buffer" "b"
   "d"  'kill-current-buffer
   "p"  'previous-buffer
   "b"  'switch-to-buffer
   "n"  'next-buffer
   ;; "s" '((lambda () (interactive) (switch-to-buffer "*scratch*"))
   ;;       :which-key "scratch-buffer")
   )
  (general-global-menu-definer
   "files" "f"
   "f"  'find-file
   )
  )

(provide 'my-general)
