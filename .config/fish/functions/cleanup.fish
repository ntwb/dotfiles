function cleanup
    # Recursively delete `.DS_Store` files
    find . -name '*.DS_Store' -type f -ls -delete
end
