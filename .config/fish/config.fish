if status is-interactive
  set -U fish_greeting ""
end

if set -q TMUX
  set -gx TERM tmux-256color
end

set -x CC clang
set -x CXX clang++
