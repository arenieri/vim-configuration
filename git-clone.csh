###############################################
# pathogen
###############################################
set DIR = others
if (! -e $DIR) then
    mkdir -p $DIR
endif

pushd $DIR

git clone git://github.com/tpope/vim-pathogen.git
# powerline uses python 2.6 or above
# airline is now the preferred choice since it is pure vim
#git clone git://github.com/Lokaltog/powerline.git

popd


###############################################
# git-bundle
###############################################
set DIR = git-bundle
if (! -e $DIR) then
    mkdir $DIR
endif
pushd $DIR

git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/scrooloose/nerdcommenter
git clone git://github.com/mbbill/undotree.git
git clone git://github.com/bling/vim-airline.git
git clone git://github.com/nathanaelkane/vim-indent-guides.git
git clone git://github.com/vim-perl/vim-perl.git
git clone git://github.com/fholgado/minibufexpl.vim.git
git clone git://github.com/vim-scripts/mru.vim.git
git clone git://github.com/majutsushi/tagbar.git
git clone git://github.com/luochen1990/rainbow.git
#git clone git://github.com/uguu-org/vim-matrix-screensaver.git
popd


