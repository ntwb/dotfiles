function ll --wraps exa
    if command --search exa > /dev/null
        exa --long --git $argv
    else
        ls -l $argv
    end
end
