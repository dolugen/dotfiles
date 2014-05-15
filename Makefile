#
# Makefile for dotfiles
#
# You can use this Makefile to install individual dotfiles or install all of
# them at once. Each makefile rule first cleans the exisiting dotfile by
# removing it and replacing it with a symlink to the specific file in
# ~/dotfiles.
#
# !!! Make sure you backup your stuff first !!!
#
# make install_irssi expects a FREENODEPASS to replace __irssipassword__ in
# the config. So you should use make install_irssi FREENODEPASS=somepass or
# make all FREENODEPASS=somepass
#


help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make all                         install everything                 '
	@echo '   make install_zsh		   install .zshrc                     '
	@echo '   make install_emacs               install .emacs                     '
	@echo '   make install_git                 install .gitconfig                 '
	@echo '   make install_i3                  install i3 files                   '
	@echo '                                                                       '
	@echo 'All install commands are also available as clean commands to remove    '
	@echo 'installed files                                                        '
	@echo '                                                                       '


all: install_zsh install_emacs install_git install_i3
	@echo ""
	@echo "dotfiles - Making yourself at home"
	@echo "=================================="
	@echo ""
	@echo "All done."

install_zsh: clean_zsh
	ln -sf `pwd`/zshrc ~/.zshrc

clean_zsh:
	rm -Rf ~/.zshrc

install_emacs: clean_emacs
	ln -sf `pwd`/emacs ~/.emacs

clean_emacs:
	rm -Rf ~/.emacs

install_git: clean_git
	ln -sf `pwd`/gitconfig ~/.gitconfig

clean_git:
	rm -Rf ~/.gitconfig

install_i3: clean_i3
	ln -sf `pwd`/Xdefaults ~/.Xdefaults
	ln -sf `pwd`/Xdefaults ~/.Xresources
	ln -sf `pwd`/i3 ~/.i3

clean_i3:
	rm -Rf ~/.Xdefaults
	rm -Rf ~/.i3
