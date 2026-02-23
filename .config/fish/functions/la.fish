function la --wraps eza
    if command --search eza > /dev/null
        eza -la $argv
    else
        ls -lah $argv
    end
end
