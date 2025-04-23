session_root "~/.config/nvim"

if initialize_session "nvim-configuration"; then
  new_window "nvim"
  run_cmd "v ."
fi

finalize_and_go_to_session
