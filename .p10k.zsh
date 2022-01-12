'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')



() {
    
    emulate -L zsh -o extended_glob
    unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
    autoload -Uz is-at-least && is-at-least 5.1 || return

    
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        os_icon
        dir
        vcs
        prompt_char
    )

    typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        status
        command_execution_time
    )


    # nerdfonts
    typeset -g                                   POWERLEVEL9K_MODE=nerdfont-complete
    typeset -g                           POWERLEVEL9K_ICON_PADDING=moderate

    # basic style options
    typeset -g                             POWERLEVEL9K_BACKGROUND=
    typeset -g                   POWERLEVEL9K_LEFT_LEFT_WHITESPACE=' '
    typeset -g                  POWERLEVEL9K_LEFT_RIGHT_WHITESPACE=
    typeset -g                  POWERLEVEL9K_RIGHT_LEFT_WHITESPACE=
    typeset -g                 POWERLEVEL9K_RIGHT_RIGHT_WHITESPACE=' '
    typeset -g      POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
    typeset -g         POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=

    # other options
    typeset -g                    POWERLEVEL9K_ICON_BEFORE_CONTENT=true
    typeset -g                     POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    typeset -g          POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
    typeset -g        POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
    typeset -g           POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
    typeset -g          POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIx=
    typeset -g        POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
    typeset -g           POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

    typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
    typeset -g   POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=

    typeset -g                             POWERLEVEL9K_SHOW_RULER=false
    typeset -g        POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '

    # os icon
    typeset -g                     POWERLEVEL9K_OS_ICON_FOREGROUND=1

    # prompt character
    typeset -g    POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=8
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=1
    typeset -g         POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=' '
    typeset -g         POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=' '
    typeset -g         POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANTION=' '
    typeset -g         POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION=' '
    typeset -g                            POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
    typeset -g        POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
    typeset -g     POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''

    # current directory
    typeset -g              POWERLEVEL9K_DIR_FOREGROUND=1
    typeset -g            POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
    typeset -g           POWERLEVEL9K_SHORTEN_DELIMITER=
    typeset -g    POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=1
    typeset -g       POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=1
    typeset -g             POWERLEVEL9K_DIR_ANCHOR_BOLD=false
    local anchor_files=(
        .bzr
        .citc
        .git
        .go-version
        .hg
        .java-version
        .lua-version
        .node-version
        .perl-version
        .php-version
        .python-version
        .ruby-version
        .shorten_folder_marker
        .svn
        .terraform
        .tool-version
        Cargo.toml
        composer.json
        CVS
        go.mod
        package.json
        stack.yaml
    )
    typeset -g       POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
    typeset -g  POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
    typeset -g          POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    typeset -g              POWERLEVEL9K_DIR_MAX_LENGTH=80
    typeset -g     POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
    typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
    typeset -g               POWERLEVEL9K_DIR_HYPERLINK=false
    typeset -g           POWERLEVEL9K_DIR_SHOW_WRITABLE=v2
    typeset -g           POWERLEVEL9K_DIR_SHOW_WRITABLE=v3
    typeset -g                 POWERLEVEL9K_DIR_CLASSES=()

    # git
    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

    # git formatter
    function my_git_formatter() {
        emulate -L zsh

        if [[ -n $P9K_CONTENT ]]; then
            typeset -g my_git_format=$P9K_CONTENT
            return
        fi

        if (( $1 )); then
            local       meta='%f'
            local      clean='%2F'
            local   modified='%3F'
            local  untracked='%4F'
            local conflicted='%1F'
        else
            local       meta='%f'
            local      clean='%f'
            local   modified='%f'
            local  untracked='%f'
            local conflicted='%f'
        fi

        local res

        if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
            local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
            (( $#branch > 32 )) && branch[13,-13]='…'
            res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
        fi

        if [[ -n $VCS_STATUS_TAG && -z $VCS_STATUS_LOCAL_BRANCH ]]; then
            local tag=${(V)VCS_STATUS_TAG}
            (( $#tag > 32 )) && tag[13,-13]='…'
            res+="${meta}#${clean}${tag//\%/%%}"
        fi

        [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&
            res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

        [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]] &&
            res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"

        (( VCS_STATUS_COMMITS_BEHIND      )) && res+=" ${clean}${VCS_STATUS_COMMITS_BEHIND}"
        (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_COMMITS_AHEAD       )) && res+="${clean}${VCS_STATUS_COMMITS_AHEAD}"
        (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}${VCS_STATUS_PUSH_COMMITS_BEHIND}"
        (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
        (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}${VCS_STATUS_PUSH_COMMITS_AHEAD}"
        (( VCS_STATUS_STASHES             )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
        [[ -n $VCS_STATUS_ACTION          ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
        (( VCS_STATUS_NUM_CONFLICTED      )) && res+=" ${conflicted}${VCS_STATUS_NUM_CONFLICTED}"
        (( VCS_STATUS_NUM_STAGED          )) && res+=" ${modified}ﰖ${VCS_STATUS_NUM_STAGED}"
        (( VCS_STATUS_NUM_UNSTAGED        )) && res+=" ${modified}ﰙ${VCS_STATUS_NUM_UNSTAGED}"
        (( VCS_STATUS_NUM_UNTRACKED       )) && res+=" ${untracked}ﰘ${VCS_STATUS_NUM_UNTRACKED}"
        (( VCS_STATUS_HAS_UNSTAGED == -1  )) && res+=" ${modified}-"

        typeset -g my_git_format=$res
    }
    functions -M my_git_formatter 2>/dev/null

    typeset -g            POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
    typeset -g        POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
    typeset -g    POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    typeset -g               POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
    typeset -g       POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

    typeset -g         POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=2
    typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=
    typeset -g     POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=

    typeset -g                        POWERLEVEL9K_VCS_BACKENDS=(git)
    typeset -g                POWERLEVEL9K_VCS_CLEAN_FOREGROUND=2
    typeset -g            POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=2
    typeset -g             POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=3

    # last command exit code
    typeset -g                          POWERLEVEL9K_STATUS_EXTENDED_STATES=true

    typeset -g                                       POWERLEVEL9K_STATUS_OK=true
    typeset -g                            POWERLEVEL9K_STATUS_OK_FOREGROUND=2
    typeset -g           POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION=''

    typeset -g                                  POWERLEVEL9K_STATUS_OK_PIPE=true
    typeset -g                       POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
    typeset -g              POWERLEVEL9K_STATUS_VISUAL_IDENTIFIER_EXPANSION=''

    typeset -g                                    POWERLEVEL9K_STATUS_ERROR=true
    typeset -g                         POWERLEVEL9K_STATUS_ERROR_FOREGROUND=1
    typeset -g        POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION=''

    typeset -g                             POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
    typeset -g                  POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=1
    typeset -g                          POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
    typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION=''

    typeset -g                               POWERLEVEL9K_STATUS_ERROR_PIPE=true
    typeset -g                    POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=1
    typeset -g   POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION=''

    # command execution time
    typeset -g                   POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
    typeset -g                   POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
    typeset -g                  POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=8
    typeset -g                      POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=


    typeset -g   POWERLEVEL9K_TRANSIENT_PROMPT=off
    typeset -g     POWERLEVEL9K_INSTANT_PROMPT=verbose
    typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

    (( ! $+functions[p10k] )) || p10k reload

}



typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'

