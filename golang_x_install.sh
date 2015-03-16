#!/bin/bash

if [ ! -d $GOPATH ]; then
  echo "GOPATH is not set. exit"
  exit
fi

GOXPATH=$GOPATH/src/golang.org/x

if [ ! $GOXPATH ]; then
  mkdir -p $GOXPATH
fi

cd $GOXPATH

for mod in net oauth2 sys tools tour
do
  if [ -d $mod ]; then
    cd $mod && echo "pull $mod..." && git pull && cd ..
  else
    git clone https://github.com/golang/$mod.git
  fi
done
