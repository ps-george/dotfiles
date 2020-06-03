# !/bin/bash

# detach from tmux session if in one
tmux detach > /dev/null

# don't set up workspace if there's already an ethiapp session running
if tmux list-sessions -F "#{session\ name}" | grep -q "ethiapp"; then
  echo "ethiapp session already running"
  exit 1
fi

cd /home/ps-george/Work/ethi/repos
tmux new -d -s ethiapp

# window 0 - main
tmux rename-window main
tmux split-window -h

# Flask server setup
tmux select-pane -t 0
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys "cd flask-server/web" C-m
tmux send-keys "gitfp" C-m

# Change pane
tmux select-pane -t 1
tmux send-keys "nvm use node" C-m
tmux send-keys "cd fiddler" C-m
tmux send-keys "gitfp" C-m

tmux attach-session -t ethiapp
