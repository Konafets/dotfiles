;; You will most likely need to adjust this font size for your system!
(defvar konafets/default-font-size 160)
(defvar konafets/default-font-family "Source Code Pro")

;; disable startup message
(setq inhibit-startup-message t)

;; Disable visible scrollbar
(scroll-bar-mode -1) 

;; Disable the toolbar
(tool-bar-mode -1)

;; Disable tooltips
(tooltip-mode -1)

;; Give some breathing room
(set-fringe-mode 10)

;; Disable the menu bar
(menu-bar-mode -1)

;; Setup the visiable bell
(setq visible-bell t)

;; Set the font face and font size
;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 180)
(set-face-attribute 'default nil :font konafets/default-font-family :height konafets/default-font-size)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Unbind the right Alt-Key from acting as META to be able to write an ~
(setq ns-right-alternate-modifier nil)

;; Always open my user directory
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; getting rid of the "yes or no" prompt and replace it with "y or n"
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use package.el to manage packages
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; use-package
(unless (require 'use-package nil t) 
  (package-refresh-contents)
  (package-install 'use-package)
  (setq use-package-always-ensure t))

;; Load the theme
(use-package doom-themes
  :ensure t 
  :init (load-theme 'doom-one t))

;; ivy
(use-package ivy
	:diminish (ivy-mode . "")
	:init (ivy-mode 1) ; globally at startup
	:config
	(setq ivy-use-virtual-buffers t)
	(setq ivy-height 20)
	(setq ivy-count-format "%d/%d ")
	:bind (
	       :map ivy-minibuffer-map
	       ("TAB" . ivy-alt-done)
               ("C-l" . ivy-alt-done)
               ("C-j" . ivy-next-line)
               ("C-k" . ivy-previous-line)
               :map ivy-switch-buffer-map
               ("C-k" . ivy-previous-line)
               ("C-l" . ivy-done)
               ("C-d" . ivy-switch-buffer-kill)
               :map ivy-reverse-i-search-map
               ("C-k" . ivy-previous-line)
   	       ("C-d" . ivy-reverse-i-search-kill)))

(use-package counsel
	:bind* ; load when pressed
	(("M-x" . counsel-M-x)
	 ("C-s" . swiper)
	 ("C-x C-f" . counsel-find-file)))

;; Use Ivy and Counsel for completions
;(global-set-key (kbd "M-y") 'counsel-yank-pop)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;(global-set-key (kbd "<f2> j") 'counsel-set-variable)
;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;(global-set-key (kbd "C-c v") 'ivy-push-view)
;(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; ivy-rich
(use-package ivy-rich
  :ensure t
  :after (ivy)
  :config (ivy-rich-mode 1))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that the mode line icons
;; display correctly
;;
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; modeline
(use-package doom-modeline
     :ensure t
     :init (doom-modeline-mode 1)
     :custom ((doom-modeline-height 15)))

;; magit
(use-package magit
    :ensure t
    :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Enable Spellchecking
(setq ispell-program-name "/opt/homebrew/bin/ispell")
(setq ispell-dictionary "deutsch8")
(setq ispell-local-dictionary "deutsch8")
(setq flyspell-default-dictionary "deutsch8")
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;;(global-set-key (kbd "C-x g") 'magit-status)

;;(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
;;(setq evil-want-keybinding nil)
;(require 'evil)
;(evil-mode 1)
;;(evil-collection-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit use-package markdown-mode ivy-rich doom-modeline counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
