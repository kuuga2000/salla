#!/usr/bin/env bash
set -euo pipefail

node --version
npm --version
salla --version
codex --version

if [[ -f package-lock.json ]]; then
    npm ci
elif [[ -f package.json ]]; then
    npm install
else
    printf '%s\n' 'Container siap. Jalankan salla login, lalu salla theme create.'
fi

# Configure terminal colors once
if ! grep -qF '# Salla terminal colors' ~/.bashrc; then
    cat >> ~/.bashrc <<'EOF'

# Salla terminal colors
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
EOF
fi
