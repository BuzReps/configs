# TODO: check if files exists: if yes: dont link and print info message?
ln -s -r bash/.bashrc ~/.bashrc
ln -s -r tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -s -r alacritty ~/.config/alacritty
ln -s -r nvim ~/.config/nvim
# TODO git:
# 1) Create ~/.gitconfig if absent
# 2) Check in ~/.gitconfig if git/.gitconfig is already included
  # 2.1) If not: echo "\n[include]\n\tpath=<this repo>/git/.gitconfig\n" into ~/.gitconfig

