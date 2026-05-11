# ~/.zsh/aliases.zsh
# Universal aliases — applies to all machines
# Machine-specific aliases live in aliases-arch.zsh, aliases-ubuntu.zsh etc.

# ─── Safety nets ──────────────────────────────────────────────────────────────

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# ─── Editor ───────────────────────────────────────────────────────────────────

alias nano='nvim'
alias vi='nvim'
alias v='nvim'

# ─── Better defaults ──────────────────────────────────────────────────────────

alias cat='bat -p'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

# ─── Help output via bat ──────────────────────────────────────────────────────

h() { "${1}" --help 2>&1 | bat -l help -p; }

# ─── Network ──────────────────────────────────────────────────────────────────

wifi() { nmcli device wifi connect "${1}" --ask; }
