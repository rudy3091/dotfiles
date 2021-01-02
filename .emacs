(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; vim keymaps
(require 'evil)
(evil-mode 1)

;; map qq to ESC
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "qq" 'evil-normal-state)
(key-chord-define evil-insert-state-map (kbd "C-o C-o") '(kbd "C-x left"))
(key-chord-define evil-insert-state-map (kbd "C-p C-p") '(kbd "C-x right"))
(key-chord-mode 1)

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'rebecca t)

;; powerline
(require 'powerline)
(powerline-default-theme)

;; no tool bar
(tool-bar-mode 0)

;; tab-width
(setq-default tab-width 4)
(setq indent-tabs-mode nil)

(setq make-backup-files nil)
(setq auto-save-default nil)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(menu-bar-mode -1)

;; transparent bg
(defun transparency (value)
	(interactive "nTransparency Value 0 - 100 opaque:")
	(set-frame-parameter (selected-frame) 'alpha value))

(defun toggle-transparency()
	(interactive)
	(let ((alpha (frame-parameter nil 'alpha)))
		(set-frame-parameter
		 nil 'alpha
		 (if (eql (cond ((numberp alpha) alpha)
										((numberp (cdr alpha)) (cdr alpha))
										((numberp (cadr alpha)) (cadr alpha)))
							100)
				 '(85, 50) '(100, 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; auto-added
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["color-233" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "color-248"])
 '(awesome-tray-mode-line-active-color "#0031a9")
 '(awesome-tray-mode-line-inactive-color "#d7d7d7")
 '(custom-safe-themes
	 '("e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "dfe0f69ae59190feffc7f3d514d893b14ebbc29114bdd32fa84543f242356654" "2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))
 '(fci-rule-color "color-237")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-theme-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-theme-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-theme-fringe-yellow))
 '(highlight-tail-colors '(("#aecf90" . 0) ("#c0efff" . 20)))
 '(hl-sexp-background-color "#efebe9")
 '(hl-todo-keyword-faces
	 '(("HOLD" . "#70480f")
		 ("TODO" . "#721045")
		 ("NEXT" . "#5317ac")
		 ("THEM" . "#8f0075")
		 ("PROG" . "#00538b")
		 ("OKAY" . "#30517f")
		 ("DONT" . "#315b00")
		 ("FAIL" . "#a60000")
		 ("BUG" . "#a60000")
		 ("DONE" . "#005e00")
		 ("NOTE" . "#863927")
		 ("KLUDGE" . "#813e00")
		 ("HACK" . "#813e00")
		 ("TEMP" . "#5f0000")
		 ("FIXME" . "#a0132f")
		 ("XXX+" . "#972500")
		 ("REVIEW" . "#005a5f")
		 ("DEPRECATED" . "#201f55")))
 '(ibuffer-deletion-face 'modus-theme-mark-del)
 '(ibuffer-filter-group-name-face 'modus-theme-mark-symbol)
 '(ibuffer-marked-face 'modus-theme-mark-sel)
 '(ibuffer-title-face 'modus-theme-pseudo-header)
 '(package-selected-packages
	 '(powerline rebecca-theme dracula-theme atom-one-dark-theme key-chord zenburn-theme sublime-themes evil))
 '(tetris-x-colors
	 [[229 192 123]
		[97 175 239]
		[209 154 102]
		[224 108 117]
		[152 195 121]
		[198 120 221]
		[86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
	 '((20 . "#a60000")
		 (40 . "#721045")
		 (60 . "#8f0075")
		 (80 . "#972500")
		 (100 . "#813e00")
		 (120 . "#70480f")
		 (140 . "#5d3026")
		 (160 . "#184034")
		 (180 . "#005e00")
		 (200 . "#315b00")
		 (220 . "#005a5f")
		 (240 . "#30517f")
		 (260 . "#00538b")
		 (280 . "#093060")
		 (300 . "#0031a9")
		 (320 . "#2544bb")
		 (340 . "#0000c0")
		 (360 . "#5317ac")))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
	 ["#000000" "#a60000" "#005e00" "#813e00" "#0031a9" "#721045" "#00538b" "#f0f0f0"])
 '(xterm-color-names-bright
	 ["#505050" "#972500" "#315b00" "#70480f" "#2544bb" "#8f0075" "#30517f" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
