(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)


;; Refresh the package descriptions
(unless package-archive-contents
  (package-refresh-contents))

;; No backup files.  No menubar.  No toolbar.
(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(setq ns-use-native-fullscreen nil)

(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 178))

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-l")  'windmove-right)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-k")  'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

;; Save histories
(setq savehist-additional-variables '(search-ring regexp-search-ring))
(savehist-mode 1)

;; Make ctrl-u work correctly
(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

(global-evil-visualstar-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "w" 'save-buffer
  "v" 'split-window-right
  "s" 'split-window-below
  "d" 'neotree-toggle
  "n" 'neotree-find
  "q" 'kill-buffer
  "h" 'delete-trailing-whitespace
  "c" (lambda() (interactive)(find-file "~/.emacs.d/init.el"))
  )

(require 'key-chord)
(key-chord-mode 1)

;; Improved escape
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)

(define-key evil-normal-state-map "gl" 'move-end-of-line)
(define-key evil-normal-state-map "gh" 'back-to-indentation)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-background-color "black")

(require 'elixir-mode)
(require 'ruby-mode)

(modify-syntax-entry (string-to-char "_") "w" ruby-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" elixir-mode-syntax-table)

;; Remove noise from neotree
(setq neo-show-updir-line nil)
(setq neo-banner-message nil)
(setq neo-theme 'arrow)
(setq neo-mode-line-type 'none)
(setq neo-window-width 30)


(add-hook 'neotree-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
   (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
   (define-key evil-normal-state-local-map (kbd "md") 'neotree-delete-node)
   (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
   (define-key evil-normal-state-local-map (kbd "mm") 'neotree-rename-node)
   (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
))


; Remember the cursor position of files when reopening them
(setq-default save-place t)
(require 'saveplace)

;; show the column number in the status bar
(column-number-mode t)

(set-frame-font "Inconsolata-dz 11")

;; Fix up parens
(show-paren-mode t)
(setq show-paren-delay 0)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)


;; Save all files when focus is lost
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

