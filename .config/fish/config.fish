if status is-interactive
  set -U fish_greeting ""

  alias scrot="scrot ~/media/scrot/%Y-%m-%d_%H-%M-%S.png"

  export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/node_modules/*' -not -path '*/.git/*'"
end

if set -q TMUX
  set -gx TERM tmux-256color
end

set -x CC clang
set -x CXX clang++
