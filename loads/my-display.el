(fringe-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(set-frame-font "PragmataPro 33" nil t)

(use-package ef-themes 
  :config
  (load-theme 'ef-autumn t)
  )

(provide 'my-display)
