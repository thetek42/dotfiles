;;; doom-tokyodark-theme.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2016-2021 thetek
;;
;; Author: thetek <https://github.com/thetek42>
;; Created: January 7, 2022
;; Version: 0.1.0
;; Keywords: custom themes, faces
;; Homepage: https://github.com/thetek42
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; Tokyo Dark theme for Emacs.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-tokyodark-theme nil
  "Options for the `doom-tokyodark' theme."
  :group 'doom-themes)

(defcustom doom-tokyodark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-tokyodark-theme
  :type 'boolean)

(defcustom doom-tokyodark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-tokyodark-theme
  :type 'boolean)

(defcustom doom-tokyodark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-tokyodark-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-tokyodark
  "Tokyo Dark Theme"

  ;; name        default   256           16
  ((bg         '("#11121d" "black"       "black"))
   (fg         '("#a0a8cd" "#bfbfbf"     "brightwhite"))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#1a1b2a" "black"       "black"))
   (fg-alt     '("#444b6a" "#2d2d2d"     "white"))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#11121d" "black"       "black"))
   (base1      '("#1a1b2a" "#1e1e1e"     "brightblack"))
   (base2      '("#212234" "#2e2e2e"     "brightblack"))
   (base3      '("#32334e" "#262626"     "brightblack"))
   (base4      '("#444b6a" "#3f3f3f"     "brightblack"))
   (base5      '("#5a5c8c" "#525252"     "brightblack"))
   (base6      '("#7376a5" "#6b6b6b"     "brightblack"))
   (base7      '("#a0a8cd" "#979797"     "brightblack"))
   (base8      '("#cdd1e5" "#dfdfdf"     "white"))

   (grey       base4)
   (red        '("#ee6d85" "#ff6655" "red"))
   (orange     '("#f6955b" "#dd8844" "brightred"))
   (green      '("#95c561" "#99bb66" "green"))
   (teal       '("#95c561" "#44b9b1" "brightgreen"))
   (yellow     '("#d7a65f" "#ECBE7B" "yellow"))
   (blue       '("#7199ee" "#51afef" "brightblue"))
   (dark-blue  '("#7199ee" "#2257A0" "blue"))
   (magenta    '("#a485dd" "#c678dd" "brightmagenta"))
   (violet     '("#a485dd" "#a9a1e1" "magenta"))
   (cyan       '("#70d6db" "#46D9FF" "brightcyan"))
   (dark-cyan  '("#70d6db" "#5699AF" "cyan"))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      red)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      base2)
   (builtin        green)
   (comments       (if doom-tokyodark-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if doom-tokyodark-brighter-comments dark-green grey) 0.25))
   (constants      orange)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      red)
   (type           blue)
   (strings        yellow)
   (variables      orange)
   (numbers        magenta)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          grey)
   (modeline-bg              (if doom-tokyodark-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-tokyodark-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-tokyodark-padded-modeline
      (if (integerp doom-tokyodark-padded-modeline) doom-tokyodark-padded-modeline 4))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-tokyodark-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-tokyodark-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground yellow)
   (css-property             :foreground orange)
   (css-selector             :foreground red)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-tokyodark-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#32334e" :foreground "#11121d")
   ;;;; ivy
   (ivy-current-match :background bg-alt :distant-foreground fg-alt :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; org mode
   (org-level-1 :foreground red)
   (org-level-2 :foreground orange)
   (org-level-3 :foreground yellow)
   (org-level-4 :foreground green)
   (org-level-5 :foreground blue)
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
  ())

;;; doom-tokyodark-theme.el ends here
