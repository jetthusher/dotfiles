# Changing Directories

## Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD

## Never  print the working directory after a cd -
setopt CD_SILENT

## Don't push multiple copies of the same directory onto the directory stack
setopt PUSHD_IGNORE_DUPS

## Exchanges the meanings of `+' and `-' when used with a number
## to specify a directory in the stack
setopt PUSHD_MINUS

## Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT

## Have pushd with no arguments act like pushd $HOME
setopt PUSHD_TO_HOME
