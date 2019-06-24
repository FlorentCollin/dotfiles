# This script create a symlink for all dotfiles
shopt -s dotglob

for file in *; do
  echo "Creating SymLink for $file"
  ln -sf $file $HOME/
done

for file in .config/*; do
  echo "Creating SymLink for .config/$file"
  ln -sf $file $HOME/.config/
done

echo "Removing symlink for the install file
unlink $HOME/install.sh

