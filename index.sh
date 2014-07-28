#!/bin/sh

baseDir=$(cd "$(dirname "$0")";cd ..; pwd)

find $baseDir -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files

cscope -bkq -i cscope.files
ctags -L cscope.files

echo "set tags+=$baseDir/.vimprj/tags" > $baseDir/.vimprj/index.vim
echo ":cs add $baseDir/.vimprj/cscope.out" >> $baseDir/.vimprj/index.vim
echo "over"
