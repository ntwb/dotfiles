function tree --wraps exa
    if command --search exa
        exa --long --git --tree
    else
        tree
    end
end
