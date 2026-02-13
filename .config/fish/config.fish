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

alias comp4304="cd ~/COMP\ 4304; and source venv/bin/activate.fish"
