(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'package-pinned-packages '(elixir-mode . "melpa-stable") t)

;; Custom Utils
(require 'init-utils)
(require 'init-gui)
(require 'ivy)
(require 'evil)
(require 'smex)
(require 'tide)
(require 'package)
(require 'haskell-mode)
(require 'ivy-explorer)
(require 'flycheck)
(require 'web-mode)
(require 'golden-ratio)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(smex-initialize)
(golden-ratio-mode 1)
(load-theme 'zenburn t)
(evil-mode 1)
(ivy-mode 1)
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup")))
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

(fringe-mode '(0 . 0))
(setq ivy-height 30)
(global-display-line-numbers-mode 1)	

;;------------------------------------------------------------
;; Custom 셋업
;;------------------------------------------------------------

(editorconfig-mode 1)
;; VIM setup
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "s-r") 'undo-tree-redo)
(define-key evil-insert-state-map (kbd "C-<space>") 'company-complete)
(define-key ivy-minibuffer-map (kbd "C-q") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "C-]") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "s-f") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "s-F") 'minibuffer-keyboard-quit)
(setq-default evil-ex-substitute-global t)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x o") 'open-file-at-cursor)
(global-set-key (kbd "C-s") 'counsel-M-x)
(global-set-key (kbd "C-]") 'find-file)
(global-set-key (kbd "C-c d") 'tide-jump-to-definition)
(global-set-key (kbd "C-c r") 'tide-references)
(global-set-key (kbd "C-c C-w") 'kill-buffer-and-return-previous)  
(global-set-key (kbd "s-w") 'kill-buffer-and-return-previous)       ;; close의 의미
(global-set-key (kbd "s-2") 'jump-to-cursor)
(global-set-key (kbd "s-]") 'other-window)
(global-set-key (kbd "s-p") 'find-file-in-project)    ;; find file in project
(global-set-key (kbd "s-b") 'ibuffer)            ;; list buffer
(global-set-key (kbd "s-/") 'comment-line)
(global-set-key (kbd "s-f") 'swiper)
(global-set-key (kbd "s-F") 'counsel-rg)
(global-set-key (kbd "s-t")  'new-empty-buffer)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "M-r") 'setup-tide-mode)


;; 타이틀바 색깔 맞추는 스크립트

;;------------------------------------------------------------
;; Tide 셋업
;;------------------------------------------------------------
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq tide-completion-detailed t)
  (setq web-mode-enable-auto-quoting nil)
  (company-mode +1))
;; aligns annotation to the right handa side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Auto reload when buffer changed
(global-auto-revert-mode t)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key (kbd "C-c r")  'revert-buffer-no-confirm)

;;--------------------------------------------
;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
;; Neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b4c35bb33fc148be174fb18d21ab73ee440faae501ccb9b15f4398eabffea79c" default)))
 '(package-selected-packages
   (quote
    (elixir-mode terraform-mode go-mode lsp-haskell find-file-in-project auto-compile typescript web-mode tide smex ivy-explorer golden-ratio evil editorconfig))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; open file path under the cursor
(defun open-file-at-cursor ()
  "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path starts with "http://", open the URL in browser.
Input path can be {relative, full path, URL}.
Path may have a trailing ":‹n›" that indicates line number. If so, jump to that line number.
If path does not have a file extension, automatically try with ".el" for elisp files.
This command is similar to `find-file-at-point' but without prompting for confirmation.
URL `http://ergoemacs.org/emacs/emacs_open_file_path_fast.html'
Version 2018-02-21"
  (interactive)
  (let* (($inputStr (if (use-region-p)
                        (buffer-substring-no-properties (region-beginning) (region-end))
                      (let ($p0 $p1 $p2
                                ;; chars that are likely to be delimiters of file path or url, e.g. space, tabs, brakets. The colon is a problem. cuz it's in url, but not in file name. Don't want to use just space as delimiter because path or url are often in brackets or quotes as in markdown or html
                                ($pathStops "^  \t\n\"`'''""|()[]{}「」<>〔〕〈〉《》【】〖〗«»‹›❮❯❬❭·。\\"))
                        (setq $p0 (point))
                        (skip-chars-backward $pathStops)
                        (setq $p1 (point))
                        (goto-char $p0)
                        (skip-chars-forward $pathStops)
                        (setq $p2 (point))
                        (goto-char $p0)
                        (buffer-substring-no-properties $p1 $p2))))
         ($path
          (replace-regexp-in-string
           "^file:///" "/"
           (replace-regexp-in-string
            ":\\'" "" $inputStr))))
    (if (string-match-p "\\`https?://" $path)
        (if (fboundp 'xahsite-url-to-filepath)
            (let (($x (xahsite-url-to-filepath $path)))
              (if (string-match "^http" $x )
                  (browse-url $x)
                (find-file $x)))
          (progn (browse-url $path)))
      (if ; not starting "http://"
          (string-match "^\\`\\(.+?\\):\\([0-9]+\\)\\'" $path)
          (let (
                ($fpath (match-string 1 $path))
                ($line-num (string-to-number (match-string 2 $path))))
            (if (file-exists-p $fpath)
                (progn
                  (find-file $fpath)
                  (goto-char 1)
                  (forward-line (1- $line-num)))
              (when (y-or-n-p (format "file no exist: 「%s」. Create?" $fpath))
                (find-file $fpath))))
        (if (file-exists-p $path)
            (progn ; open f.ts instead of f.js
              (let (($ext (file-name-extension $path))
                    ($fnamecore (file-name-sans-extension $path)))
                (if (and (string-equal $ext "js")
                         (file-exists-p (concat $fnamecore ".ts")))
                    (find-file (concat $fnamecore ".ts"))
                  (find-file $path))))
          (if (file-exists-p (concat $path ".el"))
              (find-file (concat $path ".el"))
            (when (y-or-n-p (format "file no exist: 「%s」. Create?" $path))
              (find-file $path ))))))))

;; Global macro
(defun semicolon-macro ()
  (interactive)
  (end-of-line)
  (insert ";"))
(global-set-key (kbd "s-;") 'semicolon-macro)

(defun bjm/ivy-yank-whole-word ()
  "Pull next word from buffer into search string."
  (interactive)
  (let (amend)
    (with-ivy-window
      ;;move to last word boundary
      (re-search-backward "\\b")
      (let ((pt (point))
            (le (line-end-position)))
        (forward-word 1)
        (if (> (point) le)
            (goto-char pt)
          (setq amend (buffer-substring-no-properties pt (point))))))
    (when amend
      (insert (replace-regexp-in-string "  +" " " amend)))))
;; bind it to M-j

(define-key ivy-minibuffer-map (kbd "s-f") 'bjm/ivy-yank-whole-word)

;; disable evil mouse motion for performance issue
;; https://stackoverflow.com/questions/46513910/emacs-evil-mode-binding-mouse-event
(with-eval-after-load 'evil-maps (define-key evil-motion-state-map [down-mouse-1] nil))
