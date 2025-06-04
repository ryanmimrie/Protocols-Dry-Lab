#!/bin/bash

SESSION="parallel_96"

# --- Start a new detached session ---
tmux new-session -x 240 -y 60 -d -s "$SESSION" 

# --- Manual Grid Construction (12x8 = 96 panes) ---
tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.2
tmux split-window -v -t "$SESSION":0.4
tmux split-window -v -t "$SESSION":0.4
tmux split-window -v -t "$SESSION":0.6
tmux split-window -v -t "$SESSION":0.0
tmux split-window -v -t "$SESSION":0.2
tmux split-window -v -t "$SESSION":0.4
tmux split-window -v -t "$SESSION":0.6

tmux select-layout even-vertical

tmux split-window -h -t "$SESSION":0.0
tmux split-window -h -t "$SESSION":0.0
tmux split-window -h -t "$SESSION":0.0
tmux split-window -h -t "$SESSION":0.2
tmux split-window -h -t "$SESSION":0.4
tmux split-window -h -t "$SESSION":0.4
tmux split-window -h -t "$SESSION":0.6

tmux split-window -h -t "$SESSION":0.8
tmux split-window -h -t "$SESSION":0.8
tmux split-window -h -t "$SESSION":0.8
tmux split-window -h -t "$SESSION":0.10
tmux split-window -h -t "$SESSION":0.12
tmux split-window -h -t "$SESSION":0.12
tmux split-window -h -t "$SESSION":0.14

tmux split-window -h -t "$SESSION":0.16
tmux split-window -h -t "$SESSION":0.16
tmux split-window -h -t "$SESSION":0.16
tmux split-window -h -t "$SESSION":0.18
tmux split-window -h -t "$SESSION":0.20
tmux split-window -h -t "$SESSION":0.20
tmux split-window -h -t "$SESSION":0.22

tmux split-window -h -t "$SESSION":0.24
tmux split-window -h -t "$SESSION":0.24
tmux split-window -h -t "$SESSION":0.24
tmux split-window -h -t "$SESSION":0.26
tmux split-window -h -t "$SESSION":0.28
tmux split-window -h -t "$SESSION":0.28
tmux split-window -h -t "$SESSION":0.30

tmux split-window -h -t "$SESSION":0.32
tmux split-window -h -t "$SESSION":0.32
tmux split-window -h -t "$SESSION":0.32
tmux split-window -h -t "$SESSION":0.34
tmux split-window -h -t "$SESSION":0.36
tmux split-window -h -t "$SESSION":0.36
tmux split-window -h -t "$SESSION":0.38

tmux split-window -h -t "$SESSION":0.40
tmux split-window -h -t "$SESSION":0.40
tmux split-window -h -t "$SESSION":0.40
tmux split-window -h -t "$SESSION":0.42
tmux split-window -h -t "$SESSION":0.44
tmux split-window -h -t "$SESSION":0.44
tmux split-window -h -t "$SESSION":0.46

tmux split-window -h -t "$SESSION":0.48
tmux split-window -h -t "$SESSION":0.48
tmux split-window -h -t "$SESSION":0.48
tmux split-window -h -t "$SESSION":0.50
tmux split-window -h -t "$SESSION":0.52
tmux split-window -h -t "$SESSION":0.52
tmux split-window -h -t "$SESSION":0.54

tmux split-window -h -t "$SESSION":0.56
tmux split-window -h -t "$SESSION":0.56
tmux split-window -h -t "$SESSION":0.56
tmux split-window -h -t "$SESSION":0.58
tmux split-window -h -t "$SESSION":0.60
tmux split-window -h -t "$SESSION":0.60
tmux split-window -h -t "$SESSION":0.62

tmux split-window -h -t "$SESSION":0.64
tmux split-window -h -t "$SESSION":0.64
tmux split-window -h -t "$SESSION":0.64
tmux split-window -h -t "$SESSION":0.66
tmux split-window -h -t "$SESSION":0.68
tmux split-window -h -t "$SESSION":0.68
tmux split-window -h -t "$SESSION":0.70

tmux split-window -h -t "$SESSION":0.72
tmux split-window -h -t "$SESSION":0.72
tmux split-window -h -t "$SESSION":0.72
tmux split-window -h -t "$SESSION":0.74
tmux split-window -h -t "$SESSION":0.76
tmux split-window -h -t "$SESSION":0.76
tmux split-window -h -t "$SESSION":0.78

tmux split-window -h -t "$SESSION":0.80
tmux split-window -h -t "$SESSION":0.80
tmux split-window -h -t "$SESSION":0.80
tmux split-window -h -t "$SESSION":0.82
tmux split-window -h -t "$SESSION":0.84
tmux split-window -h -t "$SESSION":0.84
tmux split-window -h -t "$SESSION":0.86

tmux split-window -h -t "$SESSION":0.88
tmux split-window -h -t "$SESSION":0.88
tmux split-window -h -t "$SESSION":0.88
tmux split-window -h -t "$SESSION":0.90
tmux split-window -h -t "$SESSION":0.92
tmux split-window -h -t "$SESSION":0.92
tmux split-window -h -t "$SESSION":0.94

# --- Launch scripts in each pane ---
# Change the script name in '' to run a different command.
# This expects a "_#" suffix before the file name extension starting at 0.

NUM_PANES=$(tmux list-panes -t "$SESSION":0 | wc -l)

for i in $(seq 0 $((NUM_PANES - 1))); do
    tmux send-keys -t "$SESSION":0."$i" "./script_${i}.sh" C-m
done

# --- Attach to session (needs to be last) ---
tmux attach -t "$SESSION"
