#
# Makefile for dotfiles
#
# You can use this Makefile to link individual dotfiles or link all of
# them at once. Each makefile rule first cleans the exisiting dotfile by
# removing it and replacing it with a symlink to the specific file in
# ~/dotfiles.
#
# !!! Make sure you backup your stuff first !!!
#
#


help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make all                     link all configs                       '
	@echo '   make install								 install packages                       '
	@echo '   make link_zsh		             link .zshrc                            '
	@echo '   make link_emacs              link .emacs                            '
	@echo '   make link_git                link .gitconfig                        '
	@echo '   make link_i3                 link i3 files                          '
	@echo '                                                                       '
	@echo 'All link commands are also available as clean commands to remove       '
	@echo 'installed files                                                        '
	@echo '                                                                       '

_all_header:
	@echo ""
	@echo "dotfiles - Making yourself at home"
	@echo "=================================="
	@echo ""

_all_footer:
	@echo ""
	@echo "All done."

all: _all_header \
	link_zsh link_emacs link_git link_i3 link_conky \
	_all_footer

install:
	@echo ""
	@echo "Installing your favorite tools"
	@echo "=============================="
	@echo ""
	apt-get -y install emacs
	apt-get -y install zsh
	apt-get -y install i3 conky
	apt-get -y install git mercurial
	apt-get -y install feh
	apt-get -y install ranger
	apt-get -y install mpd ncmpcpp
	@echo ""
	@echo "All done."

link_zsh: clean_zsh
	ln -sf `pwd`/zshrc ~/.zshrc

clean_zsh:
	rm -Rf ~/.zshrc

link_emacs: clean_emacs
	ln -sf `pwd`/emacs ~/.emacs

clean_emacs:
	rm -Rf ~/.emacs

link_git: clean_git
	ln -sf `pwd`/gitconfig ~/.gitconfig

clean_git:
	rm -Rf ~/.gitconfig

link_i3: clean_i3 make_i3
	ln -sf `pwd`/Xdefaults ~/.Xdefaults
	ln -sf `pwd`/Xdefaults ~/.Xresources
	mkdir ~/.i3
	ln -sf `pwd`/i3/config ~/.i3/config
	ln -sf `pwd`/i3/i3status.conf ~/.i3status.conf

NODENAME=$(shell uname -n)
CONFIG_EXISTS=$(shell [ -e `pwd`/i3/config-$(NODENAME) ] && echo 1 || echo 0)

make_i3:
	cp `pwd`/i3/config-base `pwd`/i3/config

ifeq ($(CONFIG_EXISTS), 1)
	cat `pwd`/i3/config-$(NODENAME) >> `pwd`/i3/config
endif

clean_i3:
	rm -Rf ~/.Xdefaults
	rm -Rf ~/.i3

link_conky: clean_conky
	ln -sf `pwd`/i3/conkyrc ~/.conkyrc

clean_conky:
	rm -Rf ~/.conkyrc
