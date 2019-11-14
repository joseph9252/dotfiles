(setq-default cursor-type 'bar)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;(set-face-attribute 'default nil :height 130)
(set-frame-font "Monaco:pixelsize=11")
(setq-default line-spacing -1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(provide 'init-gui)
