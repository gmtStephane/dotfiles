install:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	stow -t ~/.config .config
	stow -t ~/ zsh
	stow -t ~/ tmux

uninstall:
	rm -rf ~/.tmux/plugins/tpm
	stow -D -t ~/.config .config
	stow -D -t ~/ zsh
	stow -D -t ~/ tmux
