# Quick Start
Open your terminal and run
```sh
wget https://gitlab.com/tarunsharma20/dotfiles/raw/master/vim/.vimrc -P ~/
```
It'll download .vimrc file in your home directory.

Clone [Vundle](https://github.com/VundleVim/Vundle.vim) to manage your vim plugins.
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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