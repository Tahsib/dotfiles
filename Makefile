tmux:
	cat ${PWD}/.tmux.conf > ~/.tmux.conf

nvim:
	mkdir -p ~/.config 
	cp -r ${PWD}/nvim ~/.config/
