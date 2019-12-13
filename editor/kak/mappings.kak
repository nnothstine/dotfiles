
map global normal '#' ':comment-line<ret>'

# leader
map global normal , <space> -docstring 'clear selections'
map global normal <space> , -docstring 'leader'

# Buffers
map global user h ':tmux-terminal-vertical kak -c %val{session}<ret>' -docstring 'Create horizontal split'
map global user v ':tmux-terminal-horizontal kak -c %val{session}<ret>' -docstring 'Create vertical split'

evaluate-commands %sh{
    case $(uname) in
        Linux) copy="xclip -i"; paste="xclip -o" ;;
        Darwin)  copy="pbcopy"; paste="pbpaste" ;;
    esac

    printf "map global user -docstring 'paste (after) from clipboard' p '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'paste (before) from clipboard' P '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'yank to clipboard' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection to X11 clipboard}<ret>'\n" "$copy"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}

# Buffer navigation
map global user [ ':bp<ret>' -docstring 'Go to previous buffer'
map global user ] ':bn<ret>' -docstring 'Go to next buffer'

map global user <space> ':change-directory-project-root<ret>' -docstring 'cd to project root'
