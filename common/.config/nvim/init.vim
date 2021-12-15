if exists('g:vscode')
  execute 'source' '$XDG_CONFIG_HOME/nvim/vscode.vim'
else
  for f in split(glob('$XDG_CONFIG_HOME/nvim/init.d/*.vim'), '\n')
    execute 'source' f
  endfor
endif