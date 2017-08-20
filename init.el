;to load the org-mode settings

; emacs settings
(set-face-attribute 'default nil :font "Monospace-14" )
(set-frame-font "Monospace-14" nil t)
;user defined settings


;; compile the code
(org-babel-do-load-languages
 'org-babel-load-languages
  '( (perl . t)         
     (ruby . t)
     (sh . t)
     (python . t)
     (emacs-lisp . t)   
   ))

(load "~/.emacs.d/org-mode-settings")
(load "~/.emacs.d/python-settings")
(load "~/.emacs.d/normal-settings")
