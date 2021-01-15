function cat -d 'use bat if possible'
    if type -q bat
        bat $argv
    else
        command cat $argv
    end
end
