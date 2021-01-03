function digfull -d "dig full" --wraps "dig"
    dig +nocmd $argv[1] any +multiline +noall +answer
end
