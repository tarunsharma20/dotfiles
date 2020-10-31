# Quick Start
You should have git and node installed in your machine.

Run command below in your terminal if you are in mac or linux, for windows use git bash.
```sh
rm -rf ~/.vim && \
rm -f ~/.vimrc ~/.viminfo && \
mkdir -p ~/.vim/autoload/ && \
curl -o ~/.vimrc https://raw.githubusercontent.com/tarunsharma20/dotfiles/master/vim/.vimrc && \
curl -o ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
vim -c 'PlugInstall'
```
It'll take some time to install plugins in your machine, close vim whenever you are done.

To improve search performance install [ripgrep](https://github.com/BurntSushi/ripgrep)
```
https://github.com/BurntSushi/ripgrep#installation
```

To fuzzy find files in vimclap install [fzf](https://github.com/junegunn/fzf). If you are in Windows machine avoid it
```
https://github.com/junegunn/fzf#installation
```

If you want to add language servers you can use command below or [click here](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) to find more info.
```sh
vim -c 'CocInstall coc-html coc-css coc-tsserver coc-json coc-xml coc-yaml'
```

You are done :)
