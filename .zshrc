# ~/.zshrc
# $USER — Arch Linux workstation

# ─── History ──────────────────────────────────────────────────────────────────

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY        # share history across all sessions
setopt APPEND_HISTORY       # append rather than overwrite
setopt HIST_IGNORE_DUPS     # ignore consecutive duplicates
setopt HIST_IGNORE_SPACE    # ignore commands prefixed with a space
setopt HIST_REDUCE_BLANKS   # remove extra blanks from history
setopt HIST_VERIFY          # show expanded history before executing

# ─── Navigation ───────────────────────────────────────────────────────────────

setopt AUTOCD               # cd by typing directory name
setopt EXTENDED_GLOB        # extended glob patterns

# --- Path ----------------------------------------------------------------------
# Make $path array unique (deduplicate even if .zshrc is sourced multiple times)
typeset -U path
# Only prepend if not already in PATH
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && path=("$HOME/.local/bin" $path)

# ─── Completion ───────────────────────────────────────────────────────────────

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select                      # navigable menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colored completions
zstyle ':completion:*' group-name ''                    # group by category
zstyle ':completion:*:descriptions' format '%B%d%b'     # bold group headers
zstyle ':completion:*' rehash true                      # auto-rehash on new commands

# ─── Prompt ───────────────────────────────────────────────────────────────────

PROMPT='%F{040}%n%f @ %F{156}%~%f -> '
RPROMPT='%*'

# ─── Plugins ──────────────────────────────────────────────────────────────────

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─── fzf ──────────────────────────────────────────────────────────────────────
# Ctrl+R  — fuzzy history search
# Ctrl+T  — fuzzy file search, insert into command line
# Alt+C   — fuzzy cd into subdirectory

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

source /usr/share/fzf/completion.zsh

# Save TTY state before fzf loads
_tty_settings=$(stty -g 2>/dev/null)
source /usr/share/fzf/key-bindings.zsh

# Restore on EXIT/INT if fzf mangles it
_restore_tty() { [[ -n $_tty_settings ]] && stty "$_tty_settings" 2>/dev/null; }
trap '_restore_tty' INT

# Reset shell key-bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# ─── Aliases & functions ──────────────────────────────────────────────────────

source ~/.zsh/aliases.zsh
# Distro-specific aliases (yadm alternate, only present on matching distro)
[[ -f ~/.zsh/aliases-arch.zsh ]] && source ~/.zsh/aliases-arch.zsh
# ─── Man pages via bat ────────────────────────────────────────────────────────

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
