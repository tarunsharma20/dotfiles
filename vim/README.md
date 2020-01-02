# Quick Start
Open your terminal and run
```sh
wget https://gitlab.com/tarunsharma20/dotfiles/raw/master/vim/.vimrc -P ~/
```
It'll download .vimrc file in your home directory.

Clone [vim-plug](https://github.com/junegunn/vim-plug/tree/0c5f0b0528a8d7b9ced56b8f177e98f0ba4d7153) to manage your vim plugins.
```sh
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ~/.vim/autoload/
```

To improve search performance use [ripgrep](https://github.com/BurntSushi/ripgrep)

For UNIX
```sh
brew install ripgrep
```

For Windows
```sh
choco install ripgrep
```

Launch vim and run
```sh
:PluginInstall
```
Restart vim and you are done :)