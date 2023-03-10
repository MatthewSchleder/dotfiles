help:
	@echo "tasks: "
	@echo "  init: Initializes all .dotfiles for linux"
	@echo "  clean: Clean all .dotfile locations"
	@echo "  astronvim: Install AstroNvim and configurations"

nvim_clean:
	rm -rf ~/.local/share/nvim

astronvim_clean:
	rm -rf ~/.config/nvim

astronvim_install: astronvim_clean
	git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim

astronvim_reload_user:
	rm -rf ~/.config/nvim/lua/user
	git clone https://github.com/MatthewSchleder/astronvim-config ~/.config/nvim/lua/user

astronvim: astronvim_install astronvim_reload_user

init: nvim_clean astronvim

clean: nvim_clean astronvim_clean
