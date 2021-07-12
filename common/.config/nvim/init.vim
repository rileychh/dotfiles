for f in split(glob('$XDG_CONFIG_HOME/nvim/init.d/*.vim'), '\n')
  execute 'source' f
endfor
