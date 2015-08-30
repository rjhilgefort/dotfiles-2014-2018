;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
    "Configuration Layers declaration."

    (setq-default
        ;; List of additional paths where to look for configuration layers.
        ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
        dotspacemacs-configuration-layer-path '()

        ;; List of configuration layers to load. If it is the symbol `all' instead
        ;; of a list then all discovered layers will be installed.
        dotspacemacs-configuration-layers '(
            ;; ----------------------------------------------------------------
            ;; Example of useful layers you may want to use right away.
            ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
            ;; <M-m f e R> (Emacs style) to install them.
            ;; ----------------------------------------------------------------
            (auto-completion :variables
                             auto-completion-enable-company-help-tooltip t)
            better-defaults
            emacs-lisp
            git
            github
            markdown
            org
            (shell :variables
                   shell-default-height 30
                   shell-default-position 'bottom)
            syntax-checking
            version-control
            themes-megapack
            javascript
            html
            lua
            colors
            tmux
            )

        ;; List of additional packages that will be installed without being
        ;; wrapped in a layer. If you need some configuration for these
        ;; packages then consider to create a layer, you can also put the
        ;; configuration in `dotspacemacs/config'.
        dotspacemacs-additional-packages '(editorconfig)

        ;; A list of packages and/or extensions that will not be install and loaded.
        dotspacemacs-excluded-packages '()

        ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
        ;; are declared in a layer which is not a member of
        ;; the list `dotspacemacs-configuration-layers'
        dotspacemacs-delete-orphan-packages t
        )
    )

(defun dotspacemacs/init ()
    "Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration."

    ;; This setq-default sexp is an exhaustive list of all the supported spacemacs settings.
    (setq-default

        ;; holy-mode default
        dotspacemacs-editing-style 'vim

        ;; Configure "jk"
        evil-escape-key-sequence "jk"
        evil-escape-delay 0.2

        ;; If non nil output loading progress in `*Messages*' buffer.
        dotspacemacs-verbose-loading nil
        dotspacemacs-startup-banner 'official

        ;; List of items to show in the startup buffer. If nil it is disabled.
        ;; Possible values are: `recents' `bookmarks' `projects'."
        dotspacemacs-startup-lists '(recents projects)

        ;; List of themes, the first of the list is loaded when spacemacs starts.
        ;; Press <SPC> T n to cycle to the next theme in the list (works great
        ;; with 2 themes variants, one dark and one light)
        dotspacemacs-themes '(sanityinc-tomorrow-eighties
                              spacemacs-dark
                              spacemacs-light
                              solarized-dark
                              solarized-light
                              leuven
                              monokai
                              zenburn)

        ;; If non nil the cursor color matches the state color.
        dotspacemacs-colorize-cursor-according-to-state t

        ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
        ;; size to make separators look not too crappy.
        dotspacemacs-default-font '("Source Code Pro"
                                    :size 13
                                    :weight normal
                                    :width normal
                                    :powerline-scale 1.3)

        dotspacemacs-leader-key "SPC"

        ;; The leader key accessible in `emacs state' and `insert state'
        dotspacemacs-emacs-leader-key "M-m"

        ;; Major mode leader key is a shortcut key which is the equivalent of
        ;; pressing `<leader> m`. Set it to `nil` to disable it.
        dotspacemacs-major-mode-leader-key ","

        ;; Major mode leader key accessible in `emacs state' and `insert state'
        dotspacemacs-major-mode-emacs-leader-key "C-M-m"

        ;; The command key used for Evil commands (ex-commands) and
        ;; Emacs commands (M-x).
        ;; By default the command key is `:' so ex-commands are executed like in Vim
        ;; with `:' and Emacs commands are executed with `<leader> :'.
        dotspacemacs-command-key ":"

        ;; Location where to auto-save files. Possible values are `original' to
        ;; auto-save the file in-place, `cache' to auto-save the file to another
        ;; file stored in the cache directory and `nil' to disable auto-saving.
        ;; Default value is `cache'.
        dotspacemacs-auto-save-file-location 'cache

        ;; If non nil then `ido' replaces `helm' for some commands. For now only
        ;; `find-files' (SPC f f) is replaced.
        dotspacemacs-use-ido nil

        ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
        ;; several times cycle between the kill ring content.
        dotspacemacs-enable-paste-micro-state nil

        ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
        ;; the commands bound to the current keystrokes.
        dotspacemacs-guide-key-delay 0.4

        ;; If non nil a progress bar is displayed when spacemacs is loading. This
        ;; may increase the boot time on some systems and emacs builds, set it to
        ;; nil ;; to boost the loading time.
        dotspacemacs-loading-progress-bar t

        ;; If non nil the frame is fullscreen when Emacs starts up.
        ;; (Emacs 24.4+ only)
        dotspacemacs-fullscreen-at-startup nil

        ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
        ;; Use to disable fullscreen animations in OSX."
        dotspacemacs-fullscreen-use-non-native nil

        ;; If non nil the frame is maximized when Emacs starts up.
        ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
        ;; (Emacs 24.4+ only)
        dotspacemacs-maximized-at-startup t

        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's active or selected.
        ;; Transparency can be toggled through `toggle-transparency'.
        dotspacemacs-active-transparency 90

        ;; A value from the range (0..100), in increasing opacity, which describes
        ;; the transparency level of a frame when it's inactive or deselected.
        ;; Transparency can be toggled through `toggle-transparency'.
        dotspacemacs-inactive-transparency 90

        ;; If non nil unicode symbols are displayed in the mode line.
        dotspacemacs-mode-line-unicode-symbols t

        ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
        ;; scrolling overrides the default behavior of Emacs which recenters the
        ;; point when it reaches the top or bottom of the screen.
        dotspacemacs-smooth-scrolling t

        ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
        dotspacemacs-smartparens-strict-mode nil

        ;; Select a scope to highlight delimiters. Possible value is `all',
        ;; `current' or `nil'. Default is `all'
        dotspacemacs-highlight-delimiters 'all

        ;; If non nil advises quit functions to keep server open when quitting.
        dotspacemacs-persistent-server nil

        ;; List of search tool executable names. Spacemacs uses the first installed
        ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
        dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

        ;; The default package repository used if no explicit repository has been
        ;; specified with an installed package.
        ;; Not used for now.
        dotspacemacs-default-package-repository nil

        ;; Use system clipboard for yank
        select-enable-clipboard t

        ;; Supresses warning(s)
        ;; https://github.com/syl20bnr/spacemacs/issues/192
        ad-redefinition-action 'accept
        )

    ;; Fix issue with prezto on OSX
    ;; https://github.com/syl20bnr/spacemacs/issues/988
    (when (and (display-graphic-p) (eq system-type 'darwin))
        (with-eval-after-load 'exec-path-from-shell
          (exec-path-from-shell-setenv "SHELL" "/bin/bash"))))


(defun dotspacemacs/config ()
    "Configuration function. This function is called at the very end of Spacemacs
    initialization after layers configuration."

    ;; Cleanup whitespace on save
    (defun cleanup-buffer ()
        (interactive)
        (delete-trailing-whitespace))
    (add-hook 'before-save-hook 'cleanup-buffer)

    (setq-default
        ;; Follow symlinks when opening files
        vc-follow-symlinks t

        ;; Word wrap
        truncate-partial-width-windows nil
        truncate-lines t

        ;; Rulers (defaults to 80) (TODO: Multiple rulers)
        fill-column 80

        ;; Tabs, tab stop
        indent-tabs-mode nil
        whitespace-indent-tabs-mode nil
        default-tab-width 4
        tab-width 4

        ;; javascript config
        js-indent-level 4
        js2-basic-offset 4
        js2-strict-inconsistent-return-warning nil
        js2-mode-hide-comments t
        )

    ;; Remap redo
    (unbind-key "C-r" evil-normal-state-map)
    (bind-key "U" 'redo evil-normal-state-map)

    ;; Better window splitting
    (bind-key "SPC w h" 'split-window-right           evil-normal-state-local-map)
    (bind-key "SPC w j" 'split-window-below-and-focus evil-normal-state-local-map)
    (bind-key "SPC w k" 'split-window-below           evil-normal-state-local-map)
    (bind-key "SPC w l" 'split-window-right-and-focus evil-normal-state-local-map)

    ;; Tmux familiarity
    (unbind-key "C-f")
    )

;; (define-key evil-normal-state-map (kbd "C-f h") 'evil-window-left)
;; (global-unset-key (kbd "C-f"))

;; (bind-key "C-f l" 'evil-window-right)
;; (unbind-key "C-r" 'evil-normal-state-minor-mode)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
