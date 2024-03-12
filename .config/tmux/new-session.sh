# check if we are running on tmux
#
if [ -z "$TMUX" ]; then
	echo "This script should be run inside a tmux session"
	exit 1
fi

path=$(rf)

# Check if the path is empty
if [ -z "$path" ]; then
	echo "No path found"
	exit 1
fi

# Get the last two parts of the path
splitted_path=$(echo $path | awk -F'/' '{print $(NF-1) "/" $NF}')

# Check if a tmux session already exists with the same name
# if it does, attach to it
if [ -z "$(tmux list-sessions | grep $splitted_path)" ]; then
	tmux new-session -dP -s $splitted_path -c $path -n " ZSH"
	tmux new-window -c $path -n " NVIM" "nvim"
fi

tmux switch-client -t $splitted_path
