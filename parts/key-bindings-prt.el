(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-l")  'windmove-right)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-k")  'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

(global-set-key (kbd "<C-right>")  'evil-window-increase-width)
(global-set-key (kbd "<C-left>")  'evil-window-decrease-width)
(global-set-key (kbd "<C-up>")  'evil-window-increase-height)
(global-set-key (kbd "<C-down>")  'evil-window-decrease-height)

(global-set-key (kbd "<M-tab>")  'persp-next)

(global-set-key (kbd "M-x") 'smex)

(evil-leader/set-key
  "w" 'save-buffer
  "v" 'split-window-right-and-focus
  "s" 'split-window-below-and-focus
  "n" 'dired-jump
  "q" 'kill-buffer
  "g" 'browse-at-remote
  "q" (kbd ":q")
  "x" (kbd ":wq")
  "h" 'delete-trailing-whitespace
  "A" 'ag-regexp-project-at-point
  "a" 'ag-regexp-project-sans-point
  "f" 'projectile-find-file
  "p" 'projectile-persp-switch-project
  "b" 'ido-switch-buffer
  "e" 'toggle-uno-email-mode
  "E" 'reply-to-email-in-clipboard
  "1" 'previous-error
  "2" 'next-error
  "RET" 'add-enter

  ",t" 'projectile-find-file-in-test
  ",v" 'projectile-find-file-in-view
  ",l" (lambda() (interactive)(projectile-find-file-in "lib/"))
  ",m" (lambda() (interactive)(projectile-find-file-in "models/"))
  ",c" (lambda() (interactive)(projectile-find-file-in "controllers/"))
  ",h" (lambda() (interactive)(projectile-find-file-in "helpers/"))
  ",p" (lambda() (interactive)(projectile-find-file-in "presenters/"))
  ",o" (lambda() (interactive)(projectile-find-file-in "source/"))
  ",j" (lambda() (interactive)(projectile-find-file-in "javascripts/"))
  ",s" (lambda() (interactive)(projectile-find-file-in "stylesheets/"))

  "SPC" (lambda() (interactive)(insert (kbd "<SPC>")))
  "F"   (lambda() (interactive)(projectile-find-file "t"))
  )


;; Improved escape
(key-chord-define evil-insert-state-map ";;" 'evil-normal-state)
(key-chord-define evil-visual-state-map ";;" 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(define-key evil-normal-state-map "gl" (kbd "g_"))    ;; Get to end of line
(define-key evil-normal-state-map "gh" (kbd "^"))     ;; Get to first non-blank char of line

(define-key evil-normal-state-map "go" 'toggle-to-previous-buffer)
(define-key evil-normal-state-map "gp" 'toggle-to-previous-perspective)

(define-key evil-normal-state-map "zg" 'flyspell-correct-word-before-point)

;; (define-key evil-normal-state-map "gj" 'goto-next-file-in-dir)
;; (define-key evil-normal-state-map "gk" 'goto-previous-file-in-dir)

;; e is a text object for the entire buffer
(define-key evil-outer-text-objects-map "e" 'mark-whole-buffer)

;; Help with long lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "p") 'repeatable-visual-paste)

;; Bubble lines
(define-key evil-normal-state-map (kbd "M-k") (kbd "ddkP"))
(define-key evil-normal-state-map (kbd "M-j") (kbd "ddp"))
(define-key evil-visual-state-map (kbd "M-k") (kbd "xkP`[V`]"))
(define-key evil-visual-state-map (kbd "M-j") (kbd "xp`[V`]"))

(define-key evil-insert-state-map (kbd "S-SPC") 'dabbrev-expand)

;; Make ctrl-u behave correctly
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-x") 'evil-scroll-up)

;; Handle numbers correctly
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

(define-key evil-normal-state-map (kbd "C-\\") 'etags-select-find-tag-at-point)

;; Jump to matching parens
(define-key evil-normal-state-map (kbd "SPC") 'evilmi-jump-items)
(define-key evil-visual-state-map (kbd "SPC") 'evilmi-jump-items)

;; Make an arg text object act like a comma object
(define-key evil-inner-text-objects-map "," 'evil-inner-arg)
(define-key evil-outer-text-objects-map "," 'evil-outer-arg)

;; Map ctrl-j/k to up down in ido selections
(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-k") 'ido-prev-match)
))

;; esc quits all the things
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


(provide 'key-bindings-prt)



