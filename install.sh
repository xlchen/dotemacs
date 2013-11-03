#!/bin/sh

pushd . > /dev/null
cd $(dirname $0)
PATH=`pwd`
cd ~
if [ -f .emacs ]
then
    /bin/mv .emacs dotemacs.backup
    echo "you already have a .emacs, I have backed it up to dotemacs.backup"
fi
/bin/ln -s $PATH/dotemacs.el .emacs
popd > /dev/null

