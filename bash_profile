# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PS1='[\u@\h \W]$ '

# Disable gnome-ssh-askpass over SSH
[ -n "$SSH_TTY" ] && unset SSH_ASKPASS

# If logging in over ssh, log straight into tmux
if [ -z "$TMUX" -a -n "$SSH_TTY" ]; then
	if tmux has-session -t $USER; then
		exec tmux attach-session -t $USER
	else
		exec tmux new-session -s $USER
	fi
fi
