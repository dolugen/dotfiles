DIR=~/.dotfiles

all: symlink brew-install

symlink:
	ln -s $(DIR)/.gitconfig ~/.gitconfig
	ln -s $(DIR)/.zshrc ~/.zshrc

dump-brewfile:
	brew bundle dump --force --describe

brew-install:
	brew bundle install

clean:
	rm ~/.gitconfig
	rm ~/.zshrc

.PHONY: all symlink dump-brewfile brew-install clean
