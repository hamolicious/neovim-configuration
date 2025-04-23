if initialize_session "homelab"; then
  new_window "homelab"
  run_cmd "while true; do ssh -p 22 spike@192.168.0.104; sleep 1; done"

  split_h
  run_cmd "while true; do ssh -p 22 tom@192.168.0.103; sleep 1; done"

  split_h
  run_cmd "while true; do ssh -p 22 jerry@192.168.0.102; sleep 1; done"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
