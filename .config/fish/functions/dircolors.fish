function _dircolors_set_256_color
    if type -fq dircolors and; test -e ~/.dircolors.256
        eval (dircolors -c ~/.dircolors.256 | sed 's/>&\/dev\/null$//')
    end
end

function _dircolors_set_ansi_color
    if type -fq dircolors and; test -e ~/.dircolors.ansi
        eval (dircolors -c ~/.dircolors.ansi | sed 's/>&\/dev\/null$//')
    end
end

switch (echo $TERM)
    case linux
        _dircolors_set_ansi_color
    case cygwin
        _dircolors_set_ansi_color
    case '*'
        _dircolors_set_256_color
end
