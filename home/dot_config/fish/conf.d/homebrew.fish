fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/libpq/bin

set -gx HOMEBREW_NO_ENV_HINTS 1

# Homebrew shell completions
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

if test -d (brew --prefix)"/share/fish/vendor_conf.d"
    for file in (brew --prefix)/share/fish/vendor_conf.d/*.fish
        source $file
    end
end
