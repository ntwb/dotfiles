function la --wraps exa
    if command --search exa > /dev/null
        exa -la $argv
    else
        ls -lah $argv
    end
end
