if status is-interactive
  set -U fish_greeting ""
  set -U fish_user_paths /opt/novnc/utils $fish_user_paths
  set -x ANTHROPIC_API_KEY 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

  alias scrot="scrot ~/media/scrot/%Y-%m-%d_%H-%M-%S.png"
end

set -x CC clang
set -x CXX clang++

set TERM st
