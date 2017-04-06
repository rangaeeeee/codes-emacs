;;New features                                                                                     
;; feature 0001 - start- Starting Emacs with Bookmark                                              
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
;; feature 0001 - end - Starting Emacs with Bookmark  

;; feature 0002 - start - highlighting matching braces
(setq show-paren-style 'parenthesis) ; highlight brackets
(setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression
;; feature 0002 - end - highlighting matching braces

;; feature 0003 - start - 
;; feature 0003 - end - 

;;Customization                                                                                    
;;cust - 0001                                                                                      
(defalias 'list-buffers 'ibuffer) ; make ibuffer default                                           

;;cust - 0002                                                                                      
(desktop-save-mode 1) ;save/restore opened files                                                   

;;cust - 0003                                                                                      
(recentf-mode 1) ; keep a list of recently opened files                                            

;;cust - 0004                                                                                      
(global-set-key "C-n n" 'xah-toggle-read-novel-mode)

;;cust -0005
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

