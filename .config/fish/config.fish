function reload
    source ~/.config/fish/config.fish
end

function subl
    open -a "Sublime Text.app" $argv
end

function ll
    ls -lhG $argv
end

function la
    ls -lahG $argv
end

function lsd
    ls -d */
end

function ls
     command ls -hG $argv
end

function grep
     command grep --color=auto $argv
end

eval (python -m virtualfish)
