require 'etc'

@vim_bundles = {
  "wincent/Command-T.git" => "vim-commandt", 
  "scrooloose/nerdtree.git" => "vim-nerdtree",
  "mileszs/ack.vim.git" => "vim-ack",
  "Lokaltog/vim-easymotion.git" => "vim-easymotion",
  "tpope/vim-fugitive.git" => "vim-fugitive",
  "embear/vim-gnupg.git" => "vim-gnupg",
  "tpope/vim-rails.git" => "vim-rails",
  "jmartindf/vim-tcomment.git" => "vim-tcomment",
  "chriskempson/tomorrow-theme.git" => "vim-tomorrow-night"
}

@this_dir = Dir.pwd
@home_dir = Dir.home(Etc.getlogin)
@vim_bundle_dir = File.join(@this_dir, "vim/bundle")
