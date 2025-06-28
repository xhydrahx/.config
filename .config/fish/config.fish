if status is-interactive
    set --global hydro_multiline true
end

# pnpm
set -gx PNPM_HOME "/home/acream/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx PATH /usr/src/zig-aarch64-linux-0.15.0-dev.643+dc6ffc28b $PATH

source "$HOME/.cargo/env.fish"
