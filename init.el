;;New features                                                                                     
;; feature 0001 - start- Starting Emacs with Bookmark                                              
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
;; feature 0001 - start- Starting Emacs with Bookmark                                              

;;Customization                                                                                    
;;cust - 0001                                                                                      
(defalias 'list-buffers 'ibuffer) ; make ibuffer default                                           

;;cust - 0002                                                                                      
(desktop-save-mode 1) ;save/restore opened files                                                   

;;cust - 0003                                                                                      
(recentf-mode 1) ; keep a list of recently opened files                                            

;;cust - 0004                                                                                      
(global-set-key "C-n n" 'xah-toggle-read-novel-mode)
