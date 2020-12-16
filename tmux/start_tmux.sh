#!/bin/sh

session="devil"
PROJECT_DIR="~/workshop/devil"

# set up tmux
tmux start-server

# create a new tmux session
tmux new-session -d -s $session

# Rename current windows with 'platform'
tmux rename-window 'platform'

# Select pane 1, set directory and run stalyon
tmux select-pane -t 1 
tmux send-keys "cd $PROJECT_DIR/platforms/ptf-stalyon && NODE_ENV=development devil run watch-dev" Enter

# Horizontally split window and run devil init in new split
tmux split-window -h
tmux send-keys "cd $PROJECT_DIR/devil-init && NODE_ENV=development devil-plg server -d -c /Users/tarunsharma/workshop/devil/platforms/ptf-stalyon/dist/default/dev" Enter

# create a new window called consumers and set directory
tmux new-window -n 'consumers'
tmux send-keys "cd $PROJECT_DIR/consumers" Enter

# Horizontally split window and set directory
tmux split-window -h
tmux send-keys "cd $PROJECT_DIR/consumers" Enter

# Create vertically split on current windows and set directory
tmux split-window -v
tmux send-keys "cd $PROJECT_DIR/consumers" Enter

# Select pane 1 and vertically split that too and set directory in new pane
tmux select-pane -t 1 
tmux split-window -v
tmux send-keys "cd $PROJECT_DIR/consumers" Enter

# create a new window called vim and run vim after setting directory
tmux new-window -n 'vim'
tmux send-keys "cd $PROJECT_DIR && vim ." Enter

# create a new windows git and set directory
tmux new-window -n 'git'
tmux send-keys "cd $PROJECT_DIR" Enter

# select session 2 (consumer session)
tmux select-window -t $session:2

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
