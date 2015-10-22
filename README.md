@rjhilgefort dotfiles
---------------------

My configuration files.

# Environment Dependencies

- git
- node
- npm
- zsh
- tig
- tmux#2.1

# Install

- `git clone (this repo)`
- `git submodule update --init --recursive`
- `./.bin/brewfile.sh`
- `./.bin/caskfile.sh`
- `npm install`
- `./install.js`
- Next you'll need to setup Karabiner and Seil with the proper key mods
	- Remove any native mapping to your control key in apple's system prefs (on any/all keyboards)
	- Seil
		- "Change the caps lock key" to 80
		- "Change escape" to 79
	- Karabiner
		- "Change Key" Tab
			- Click "Reload XML" (the install script already linked the proper config file to the Karabiner directory
			- If the two "remapping" boxes aren't selected, select them
		- "Key Repeat" Tab
			- Basic Configurations > Key Repeat > Delay Until Repeat > 0
			- Basic Configurations > Key Repeat > Key Repeat > 20

