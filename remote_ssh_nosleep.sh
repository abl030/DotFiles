# ~/.zshrc

function mask_sleep_targets() {
  sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
}

function unmask_sleep_targets() {
  sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
}

precmd() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    mask_sleep_targets
  fi
}


# Define your function to execute commands on shell exit
function shellExit {
  if [[ -n "$SSH_CONNECTION" ]]; then
    unmask_sleep_targets
  fi
}

# Trap the EXIT signal to execute shellExit function on shell exit
trap shellExit EXIT