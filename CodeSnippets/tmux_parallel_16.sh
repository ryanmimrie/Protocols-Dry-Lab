#!/bin/bash

SESSION="parallel_16"

# --- Start a new detached session ---
tmux new-session -d -s "$SESSION"

# --- Manual Grid Construction (4x4 = 16 panes) ---

tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.2

tmux split-window -h -t "$SESSION":0.0
tmux split-window -h -t "$SESSION":0.0
tmux split-window -h -t "$SESSION":0.2

tmux split-window -h -t "$SESSION":0.4
tmux split-window -h -t "$SESSION":0.4
tmux split-window -h -t "$SESSION":0.6

tmux split-window -h -t "$SESSION":0.8
tmux split-window -h -t "$SESSION":0.8
tmux split-window -h -t "$SESSION":0.10

tmux split-window -h -t "$SESSION":0.12
tmux split-window -h -t "$SESSION":0.12
tmux split-window -h -t "$SESSION":0.14

# --- Launch scripts in each pane ---
# Change the script name in '' to run a different command.
# This expects a "_#" suffix before the file name extension starting at 0.

NUM_PANES=$(tmux list-panes -t "$SESSION":0 | wc -l)

for i in $(seq 0 $((NUM_PANES - 1))); do
    tmux send-keys -t "$SESSION":0."$i" "./script_${i}.sh" C-m
done

# --- Attach to session (needs to be last) ---
tmux attach -t "$SESSION"
