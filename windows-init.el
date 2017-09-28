(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "b24ee45778296405489a56484d90901150b32e99c6dc48394184a745491d92f9" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "1bd3277d84571843d6ba2c646bc71947ee7732e4cb56c9ebd81ad4a563cf48a8" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (zenburn-theme cyberpunk-theme monokai-theme phoenix-dark-mono-theme plantuml-mode elfeed tangotango-theme which-key web-mode virtualenvwrapper virtualenv use-package undo-tree try tern-auto-complete spacemacs-theme smartparens shell-switcher prodigy ox-reveal origami org-bullets org-ac nodejs-repl moe-theme magit js2-refactor jedi iedit hungry-delete htmlize ggtags flycheck eziam-theme expand-region emmet-mode elpy elfeed-org elfeed-goodies dumb-jump dired-quick-sort dired+ default-text-scale counsel-projectile color-theme beacon base16-theme auctex alect-themes ace-window ac-js2 ac-cider)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
         '("org" . "http://orgmode.org/elpa/") t) 

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))
(load "~/.emacs.d/ob-plantuml")

;;Booksmarks
(setq bookmark-save-flag 1) ; everytime bookmark is changed, automatically save it
(setq bookmark-save-flag t) ; save bookmark when emacs quits

;;load bookmark at startup
(defalias 'list-buffers 'ibuffer)
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")



;; to insert source code block
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '( "python" "plantuml" "C++" "emacs-lisp" "C" "sh" "java" "js" "clojure" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
;    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (if (equal src-code-type "python") (insert(format "#+BEGIN_SRC %s\n" "python -n :results output")) (insert(format "#+BEGIN_SRC %s -n :results output\n" src-code-type)))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                                           'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))

(setq org-src-fontify-natively t)
(setq org-export-html-postamble nil)
(setq org-confirm-babel-evaluate nil)
(set-face-attribute 'default nil :height 150)
;; set a default font
;(when (member "DejaVu Sans Mono" (font-family-list))
;(set-face-attribute 'default nil :font "DejaVu Sans Mono-20"))
;(setq org-babel-default-header-args
;      (cons '(:exports . "both")
;           (cons '(:exports . "code")
;  (assq-delete-all :exports org-babel-default-header-args)))
;(setq org-babel-default-header-args
;           (cons '(:results . "output")
;                 (assq-delete-all :results org-babel-default-header-args)))

(org-babel-load-file (expand-file-name "~/.emacs.d/my-orgmode.org"))
