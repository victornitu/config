set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set -g fish_prompt_pwd_dir_length 0
	printf '%s' (set_color green)(whoami)
    printf '%s' (set_color white)'@'
	printf '%s' (set_color blue)(hostname | cut -d . -f 1)
	printf '%s' (set_color white)':'
	printf '%s' (set_color cyan)(prompt_pwd)
	printf '%s' (set_color white)':'
	printf '%s' (__fish_git_prompt)
	printf '%s' (set_color white)' > '
end

function fish_right_prompt -d "Write out the right prompt"
    set_color purple
    date '+%H:%M:%S %d/%m/%Y'
end

set -x USR_LOCAL /usr/local
set -x LOCAL_NPM ./node_modules

set -x PATH $USR_LOCAL/bin $LOCAL_NPM/.bin $PATH

