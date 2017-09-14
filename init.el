(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tangotango-theme which-key web-mode virtualenvwrapper virtualenv use-package undo-tree try tern-auto-complete spacemacs-theme smartparens shell-switcher prodigy ox-reveal origami org-bullets org-ac nodejs-repl moe-theme magit js2-refactor jedi iedit hungry-delete htmlize ggtags flycheck eziam-theme expand-region emmet-mode elpy elfeed-org elfeed-goodies dumb-jump dired-quick-sort dired+ default-text-scale counsel-projectile color-theme beacon base16-theme auctex alect-themes ace-window ac-js2 ac-cider))))
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
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t) 

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


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
          '( "python" "C++" "emacs-lisp" "C""sh" "java" "js" "clojure" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
;    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (if (equal src-code-type "python") (insert(format "#+BEGIN_SRC %s\n" "python :results output")) (insert(format "#+BEGIN_SRC %s\n" src-code-type)))
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
