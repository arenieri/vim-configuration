###############################################
# pathogen
###############################################
set DIR = others
if (! -e $DIR) then
    mkdir -p $DIR
endif

pushd $DIR

git clone git://github.com/tpope/vim-pathogen.git
git clone git://github.com/Lokaltog/powerline.git

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
git clone git://github.com/mbbill/undotree.git
git clone git://github.com/nathanaelkane/vim-indent-guides.git
git clone git://github.com/vim-perl/vim-perl.git
git clone git://github.com/fholgado/minibufexpl.vim.git
git clone git://github.com/vim-scripts/mru.vim.git

popd 


