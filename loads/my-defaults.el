(setq max-specpdl-size 6000)
(setq backup-directory-alist `(("." . "~/.emacs-save")))
(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-do-not-save-duplicates t)
(setq save-interprogram-paste-before-kill t)
(setq scroll-preserve-screen-position 'always)
(setq column-number-mode t)
(setq tab-always-indent 'complete)
(global-subword-mode 1)
(setq read-process-output-max (* 3 1024 1024))
(setq-default tab-width 4)

(recentf-mode 1)
(setq recentf-max-menu-items 100)
(setq recentf-max-saved-items 100)


(defadvice kill-region (before unix-werase activate compile)
  "When called interactively with no active region, delete a single word
    backwards instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (save-excursion (backward-word 1) (point)) (point)))))

(define-key global-map (kbd "C-x C-c") 'kill-buffer)
(define-key global-map (kbd "C-x C-m") 'execute-extended-command)
(define-key global-map (kbd "C-x m") 'execute-extended-command)
(define-key global-map (kbd "M-y") 'yank-from-kill-ring)

(global-eldoc-mode -1)

(provide 'my-defaults)
