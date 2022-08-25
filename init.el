(add-to-list 'load-path (file-truename "~/.emacs.d/loads"))

(setq straight-use-package-by-default t)
(setq straight-check-for-modifications nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

(require 'my-defaults) 
(require 'my-display)
(require 'my-evil)
(require 'my-general)
(require 'my-editing)
(require 'my-vertico)
(require 'my-popper)
(require 'my-vterm)
(require 'my-navigation) 
(require 'my-magit)
;; (require 'my-eglot)
(require 'my-lsp)
(require 'my-company)
(require 'my-flycheck)
(require 'my-golang)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
