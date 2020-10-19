# Quick Start
You should have git and node installed in your machine.

Run command below in your terminal if you are in mac or linux, for windows use git bash.
```sh
rm -rf ~/.vim && \
rm -f ~/.vimrc ~/.viminfo && \
mkdir -p ~/.vim/autoload/ && \
curl -o ~/.vimrc https://github.com/tarunsharma20/dotfiles/blob/features/fzf-lsp/vim/.vimrc && \
curl -o ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
vim -c 'PlugInstall'
```
It'll take some time to install plugins in your machine, close vim whenever you are done.

To search files and text in files install [ripgrep](https://github.com/BurntSushi/ripgrep)
```
https://github.com/BurntSushi/ripgrep#installation
```

To fuzzy find files install [fzf](https://github.com/junegunn/fzf).
```
https://github.com/junegunn/fzf#installation
```

If you want syntax highlighting in preview of fzf install [BAT](https://github.com/sharkdp/bat)
```sh
https://github.com/sharkdp/bat/#installation
```

You are done :)
