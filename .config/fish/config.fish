function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set -g fish_prompt_pwd_dir_length 0
    echo -n (set_color green)(whoami)(set_color white)'@'(set_color blue)(hostname | cut -d . -f 1)(set_color white)':'(set_color cyan)(prompt_pwd)(set_color white)'('(set_color purple)"$git_branch"(set_color white)') > '
end

function fish_right_prompt -d "Write out the right prompt"
    set_color purple
    date '+%H:%M:%S %d/%m/%Y'
end

set -x USR_LOCAL /usr/local
set -x LOCAL_NPM ./node_modules

set -x PATH $USR_LOCAL/bin $LOCAL_NPM/.bin $PATH

