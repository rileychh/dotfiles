function v
if test $argv
vi $argv
else
vi -S .cache/nvim/Session.vim
end
end
