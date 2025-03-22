.PHONY: install-tmux

install-tmux:
	@-cp ~/.tmux.conf ~/.tmux-bckp.conf
	@-rm ~/.tmux.conf
	@sudo ln ~/.config/nvim/.tmux.conf ~/.tmux.conf
