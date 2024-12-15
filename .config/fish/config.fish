if status is-interactive
  set -U fish_greeting ""
  set -U fish_user_paths /opt/novnc/utils $fish_user_paths
  set hydro_symbol_git_ahead (printf '\u2191 ')

  alias scrot="scrot ~/media/scrot/%Y-%m-%d_%H-%M-%S.png"
end

set -x CC clang
set -x CXX clang++

set TERM st
