.PHONY: install-tmux

reinstall-tmux:
	@-rm ~/.tmux.conf
	@sudo ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf

install-tmux:
	@-cp ~/.tmux.conf ~/.tmux-bckp.conf
	@-rm ~/.tmux.conf
	@sudo ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
