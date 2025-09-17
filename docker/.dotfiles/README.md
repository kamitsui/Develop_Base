# About dotfiles

各ツールの設定ファイルを`.dotfiles`ディレクトリで管理しています。

必要なコマンド`stow` : シンボリックリンクをそれぞれの設定ファイルPATHに作ることができます。

```
$ tree -a docker/.dotfiles/
docker/.dotfiles/
├── README.md
├── create_symlinks.sh
└── packages
    ├── tmux
    │   └── .tmux.conf
    └── vim
        └── .vimrc
```


# How to use

Create symbolic link
```bash
# Create symbolink
stow -v -d ~/.dotfiles/packages -t ~ zsh

# if exist old symbolinks
stow -R -v -d ~/.dotfiles/packages -t ~ zsh
```
