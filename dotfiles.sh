# Ensure git is installed.
git --version &> /dev/null
if [[ "$?" != 0 ]]; then
  echo "Please install git then try again."
  exit 1
fi

# Install Vundle.
if [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  echo "Removing existing Vundle."
  rm -rf ~/.vim/bundle/Vundle.vim
fi
echo "Installing Vundle."
git clone --quiet https://github.com/svermeulen/vundle.git ~/.vim/bundle/vundle

# Install .vimrc.
if [[ -f ~/.vimrc ]]; then
  echo "Removing existing .vimrc."
  rm ~/.vimrc
fi
echo "Installing .vimrc."
cp .vimrc ~/.vimrc

# Install Vim plugins.
sleep 1
vim +BundleInstall +qall
