source /usr/share/cachyos-fish-config/cachyos-config.fish
set -x LANG en_CA.UTF-8
set -x LC_ALL en_CA.UTF-8
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
fish_add_path ~/.local/bin

function passman
    python3 ~/projects/password-manager/main.py
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias comp4304="cd ~/COMP\ 4304; and source venv/bin/activate.fish"
