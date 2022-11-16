(setq doom-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq display-line-numbers-type t)

(setq doom-theme 'doom-outrun-electric)

(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(setq org-directory "~/org/")
(setq org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆"))
      ;;org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists

(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t))
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)
(map! :leader
      :desc "Clone indirect buffer other window"
      "b c" #'clone-indirect-buffer-other-window)

(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 'logo)
  ;(setq dashboard-startup-banner "~/.config/doom/doom-emacs-dash.png")
  (setq dashboard-center-content t))
  :config
  (dashboard-setup-startup-hook)
(setq doom-fallback-buffer "*dashboard")

(beacon-mode 1)

(map! :leader
      ;;(:prefix ("d" . "dired")
      :desc "Opens dired"
      "d d" #'dired)
     ;;(:after dired
      ;;(:map dired-mode-map)))

;;(evil-define-key 'normal dired-mode-map
;;  (kbd "h") 'dired-up-directory
;;  (kbd "l") 'dired-open-file


;;(setq dired-open-extensions '(("gif" . "sxiv")
;;                              ("jpg" . "sxiv")
;;                              ("png" . "sxiv")
;;                              ("mkv" . "mpv")
;;                              ("mp4" . "mpv")))

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme)
  (spaceline-toggle-org-clock-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-version-control-off))
