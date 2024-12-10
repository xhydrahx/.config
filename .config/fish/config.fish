if status is-interactive
  set -U fish_user_paths /opt/novnc/utils $fish_user_paths
end

set -x CC clang
set -x CXX clang++
