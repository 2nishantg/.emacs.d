(setq user-emacs-directory (file-truename "~/.temacs/"))
(add-to-list 'load-path (file-truename "~/.temacs/loads"))

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

(require 'my-display)
(require 'my-evil)
(require 'my-general)
(require 'my-vertico)
(require 'my-eglot)
(require 'my-golang)
(require 'my-company)
(require 'my-defaults) 
