.PHONY: install-tmux

install-tools:
	@sudo apt install jq
	@brew install ripgrep
	@brew install lazygit
	@brew install lazydocker

reinstall-tmux:
	@-rm ~/.tmux.conf
	@sudo ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf

install-tmux:
	@-cp ~/.tmux.conf ~/.tmux-bckp.conf
	@-rm ~/.tmux.conf
	@sudo ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
