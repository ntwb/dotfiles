function tree --wraps eza
    if command --search eza
        eza --long --git --tree
    else
        tree
    end
end
