# nvm wrapper for fish shell - uses https://github.com/edc/bass
function nvm  --description "nvm bass fish wrapper"
	bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
