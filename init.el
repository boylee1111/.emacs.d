(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Adding lisp/ into search path
(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

;; require init file
(global-linum-mode t)
(global-visual-line-mode t)
(electric-pair-mode 1)
(global-font-lock-mode 0) ;; turn off syntax highlighting
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(setq column-number-mode t)

;; ====================== plugins config ======================

;; autocomplete config
;; (ac-config-default)

;; emojify config
(add-hook 'after-init-hook #'global-emojify-mode)

;; google-translate config
(setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en")))

;; undo-tree config
;; (global-undo-tree-mode)
(defun undo-tree-visualizer-update-linum (&rest args)
    (linum-update undo-tree-visualizer-parent-buffer))
(advice-add 'undo-tree-visualize-undo :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-redo :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-undo-to-x :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualize-redo-to-x :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualizer-mouse-set :after #'undo-tree-visualizer-update-linum)
(advice-add 'undo-tree-visualizer-set :after #'undo-tree-visualizer-update-linum)

;; rainbow-delimiters config
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; visual-regexp config
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; neotree config
(global-set-key [f8] 'neotree-toggle)
(neotree-toggle)
(switch-to-buffer-other-window "*scratch*")

;; wttrin confg
(setq wttrin-default-cities '(("Shanghai" "China") ("Pittsburgh")))

;; paradox config
 (setq paradox-github-token "98f68fe913f49514fc5af84f308d6c09c0a3b471")

;; ============================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paradox wttrin xkcd neotree visual-regexp rainbow-delimiters undo-tree auctex google-translate emojify markdown-mode auto-complete)))
 '(paradox-automatically-star t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'erase-buffer 'disabled nil)
