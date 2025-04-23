# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Documents/Apps"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "minecraft"; then
  new_window "tlauncher"
  run_cmd "java -Djavax.accessibility.assistive_technologies= -jar TLauncher.jar"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
