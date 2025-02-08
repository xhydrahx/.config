if status is-interactive
  set -U fish_greeting ""

  alias scrot="scrot ~/media/scrot/%Y-%m-%d_%H-%M-%S.png"

  export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/node_modules/*' -not -path '*/.git/*'"
  fish_config theme choose "Rosé Pine"
end

set -x CC clang
set -x CXX clang++

set TERM st
