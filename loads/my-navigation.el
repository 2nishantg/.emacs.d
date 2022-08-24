(use-package winum
  :after general
  :config
  (winum-mode +1)
  (global-definer
    "1"   'winum-select-window-1
    "2"   'winum-select-window-2
    "3"   'winum-select-window-3
    "4"   'winum-select-window-4
    "5"   'winum-select-window-5
    "6"   'winum-select-window-6
    ))

(provide 'my-navigation)
