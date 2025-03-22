.PHONY: install-tmux

install-tmux:
	@-rm ~/.tmux.conf
	@sudo ln ~/.config/nvim/.tmux.conf ~/.tmux.conf
