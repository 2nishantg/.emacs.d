(use-package vterm
  :hook (vterm-mode . hide-mode-line-mode)
  :config
  (defun vterm-send-C-k ()
     "Send `C-k' to libvterm."
     (interactive)
     (kill-ring-save (point) (vterm-end-of-line))
     (vterm-send-key "k" nil nil t))


  (add-hook   'vterm-exit-functions (lambda (buffer event)
				      (evil-quit)
				      (kill-buffer buffer)))
  (setq vterm-buffer-name-string "vterm @ %s")
  (general-define-key
   :states      '(normal insert)
   :keymaps     'vterm-mode-map
   "C-g"        'vterm--self-insert 
   "C-c escape" 'vterm-send-escape
   "M-y"        'vterm-yank-pop
   "C-z"        'vterm--self-insert
   "C-k"        'vterm-send-C-k
   )

  (evil-set-initial-state 'vterm-mode 'insert)
  )


;;;###autoload
  (defun +vterm/here (arg)
    "Open a terminal buffer in the current window at project root.

If prefix ARG is non-nil, cd into `default-directory' instead of project root.

Returns the vterm buffer."
    (interactive "P")
    (+vterm--configure-project-root-and-display
     arg
     (lambda()
       (require 'vterm)
       ;; HACK forces vterm to redraw, fixing strange artefacting in the tty.
       (save-window-excursion
	 (pop-to-buffer "*scratch*"))
       (let (display-buffer-alist)
	 (vterm vterm-buffer-name)))))

  (defun +vterm--configure-project-root-and-display (arg display-fn)
    "Sets the environment variable PROOT and displays a terminal using `display-fn`.

If prefix ARG is non-nil, cd into `default-directory' instead of project root.

Returns the vterm buffer."
    (unless (fboundp 'module-load)
      (user-error "Your build of Emacs lacks dynamic modules support and cannot load vterm"))
    (let* ((project-root default-directory)
	   (default-directory
	     (if arg
		 default-directory
	       project-root)))
      (setenv "PROOT" project-root)
      (funcall display-fn)))

(provide 'my-vterm)
