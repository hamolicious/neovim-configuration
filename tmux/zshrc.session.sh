session_root "~/.zsh"

if initialize_session "zshrc"; then
  new_window "zshrc"
	run_cmd "v ."
fi

finalize_and_go_to_session
