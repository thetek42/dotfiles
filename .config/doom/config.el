;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "thetek"
      user-mail-address "mail@thetek.de")

(setq doom-font (font-spec :family "Iosevka" :size 18 :weight 'semi-bold)
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 14))

(setq doom-themes-enable-italic t)
(setq doom-themes-enable-bold t)
(setq doom-theme 'doom-tokyodark)
(advice-add #'load-theme :after (lambda (&rest _) (set-face-italic 'font-lock-comment-face t)))

; highlight function calls
(dolist (mode-iter '(c-mode))
  (font-lock-add-keywords
    mode-iter
    '(("\\([_a-zA-Z][_a-zA-Z0-9]*\\)\s*(" 1 'font-lock-function-name-face keep))))


(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(setq all-the-icons-scale-factor 0.9)

(require 'svg-tag-mode)
(setq svg-tag-tags
  '(("TODO:" . ((lambda (tag) (svg-tag-make "todo" :font-family "Cantarell" :font-size 14 :face 'org-todo))))))
(svg-tag-mode t)

;; (defun my/org-mode-hook ()
;;   (set-face-attribute 'org-level-1 nil :inherit 'fixed-pitch :height 240 :weight 'bold)
;;   (set-face-attribute 'org-level-2 nil :inherit 'fixed-pitch :height 200 :weight 'bold)
;;   (set-face-attribute 'org-level-3 nil :inherit 'fixed-pitch :height 180 :weight 'bold)
;;   (set-face-attribute 'org-level-4 nil :inherit 'fixed-pitch :height 160 :weight 'bold))
;; (add-hook 'org-mode-hook #'my/org-mode-hook)






;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
