;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dominik Mendel"
      user-mail-address "Dominikmendel95@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-horizon)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")
(setq org-journal-dir "~/Dropbox/org/journal")
;; (setq org-journal-dir "~/Dropbox/org/journalTest")
(setq org-journal-date-prefix "* ")
(setq org-journal-file-format "Journal %Y-%m.org")
(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-enable-agenda-integration t)
(setq org-journal-enable-cache t)
(setq org-journal-file-type 'monthly)
(setq! org-journal-time-format "")

(setq org-roam-directory "~/Dropbox/org/roam")

(setq deft-directory "~/Dropbox/org"
      deft-extensions '("org" "txt")
      deft-recursive t)
;; (setq! org-journal-carryover-items "TODO=\"TODO\"|TODO=\"INPROGRESS\"|TODO=\"WAITING\"")
;; (setq! org-journal-carryover-items "TODO=\"TODO\"|TODO=\"INPROGRESS\"")
;; (setq! org-journal-carryover-items "-TODO=\"DONE\"|-TODO=\"CANCELLED\"")
;; (setq! org-journal-carryover-items "-TODO=\"DONE\"")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(setq org-startup-indented t)           ;; Indent according to section

(defun make-youtube-time-link (link-text)
  (let ((substrings (split-string link-text ",")))
  (browse-url (format "%s&t=%sm%ss" (first substrings) (second substrings) (third substrings)))))

(after! org-journal
  (setq! org-journal-carryover-items "TODO=\"TODO\"|TODO=\"INPROGRESS\"|TODO=\"WAITING\"|TODO=\"BLOCKED\""))
  ;; (setq! ort-todo-keyword-faces
  ;;       `(("TODO" . org-warning) ("WAITING" . "yellow")
  ;;         ("CANCELED" . (:foreground "blue" :weight bold)))))

(after! org
  (org-add-link-type "yt" #'make-youtube-time-link)
  ;; (setq org-todo-keywords '((sequence  "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)") (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (setq org-todo-keywords
        '((sequence  "TODO(t)" "INPROGRESS(i!)" "WAITING(w@/!)" "BLOCKED(b@/!)" "|" "DONE(d@)" "CANCELLED(c!)" "ABANDONED(a@)")
          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (setq org-log-done 'time)
  ;; (setq org-fancy-priorities-list '("❗" "⬆" "⬇" "☕"))

)

(after! org-roam
  ;; (map! :leader
  ;;       :prefix "r"
  ;;       :desc "org-roam-insert" "i" #'org-roam-insert)
  (org-roam-db-build-cache ())

  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           ;; added a double space at the end for the double-space insert link issue.
           :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n- tags ::  "
           :unnarrowed t)

          ("a" "New Area" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           ;; added a double space at the end for the double-space insert link issue.
           :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n- tags :: [[file:../../../Dropbox/org/roam/20210410-indexes.org][Indexes]] "
           :unnarrowed t)

          ("r" "Reading" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           ;; added a double space at the end for the double-space insert link issue.
           :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n- tags ::  %?\n* Notes\n* Vocabular\n* Overview"
           :unnarrowed t)

          ("j" "Japanese")
          ("jj" "Japanese Vocabulary" plain (function org-roam--capture-get-point)
           :file-name "%<%Y%m%d>-${slug}"
           :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n#+roam_tags: %^{prompt}\n- tags :: [[file:../../../Dropbox/org/roam/20210410-japanese.org][Japanese]] \n\n* Definition"
           "%?"
           :unnarrowed t)

          ("jk" "Japanese Kanji" plain (function org-roam--capture-get-point)
           ;; "%?"
           :file-name "%<%Y%m%d>-${slug}"
           :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n#+roam_tags: %^{prompt}\n- tags :: [[file:../../../Dropbox/org/roam/20210410-japanese.org][Japanese]] \n\n* Readings\n** onyomi %?\n** kunyomi "
           :unnarrowed t)
          ))

  (setq org-roam-capture-ref-templates
       '(("r" "ref" plain #'org-roam-capture--get-point "%?"
          :file-name "website/%(url-host (url-generic-parse-url \"${ref}\"))-${slug}"
          :head "#+TITLE: ${title}\n#+Created: %u\n#+last_modified: %U\n#+roam_key: ${ref}\n- tags ::  "
          :unnarrowed t))))


(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("❗" "⬆" "⬇" "☕")))

;; (define-package! org-fancy-priorities
;;   :hook (org-mode . org-fancy-priorities-mode)
;;   :config
;;   (setq org-fancy-priorities-list '("❗" "⬆" "⬇" "☕")))


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

(map! :leader
      "w /" #'evil-window-vsplit
      "w -" #'evil-window-split
      "RET" #'org-insert-subheading
      "k" #'org-previous-visible-heading
      "K" #'outline-up-heading
      "j" #'org-next-visible-heading
      ;; "J" #'(lambda () (interactive) (call-interactively #'outline-up-heading) (call-interactively #'org/insert-item-below))
      ;; "J" #'(lambda () (interactive) (call-interactively #'outline-up-heading) (#'org/insert-item-below 1))
      "J" #'outline-back-to-heading
      )

;; (map! :localleader
      ;; "j j" #'(lambda () (interactive) (call-interactively) (outline-up-heading) (org/insert-item-below)))
        ;; "j j" #'(lambda () (interactive) (call-interactively #'outline-up-heading) (call-interactively #'org/insert-item-below))
      ;; "j k" #'outline-up-heading)
