alias activate 'source .venv/bin/activate.fish'
alias mkvenv 'python3 -m venv .venv --prompt "$(basename $(pwd))"'
alias vim nvim
alias ls 'eza --group-directories-first'
alias tree 'eza --tree --group-directories-first'
alias gitui "eval (ssh-agent -c) >/dev/null;\
    and ssh-add ~/.ssh/id_rsa 2>/dev/null;\
    and command gitui"
alias test.rs "cargo nextest run \
    --failure-output=never \
    --no-fail-fast \
    --final-status-level=none \
    --test-threads=1 \
    --hide-progress-bar \
    --color=always \
    --run-ignored=all \
    2>&1"
alias nebula-dl "cd /ext/nebula-dl && yt-dlp \
    --cookies /home/dirk/nebula.tv_cookies.txt \
    --all-subs \
    --format 1815+audio-English \
    --merge-output-format mkv \
    --embed-subs"

set EDITOR nvim

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
set -U fish_greeting
starship init fish | source

bind \e\[5\;5~ 'tmux previous-window'
bind \e\[6\;5~ 'tmux next-window'

