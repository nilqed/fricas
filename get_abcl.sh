#!/bin/bash
cd ./contrib/abcl
wget https://abcl.org/releases/1.8.0/abcl-bin-1.8.0.tar.gz
cd contrib/abcl
tar xvf abcl-bin-1.8.0.tar.gz
rm abcl-bin-1.8.0.tar.gz
cp ./abcl-bin-1.8.0/abcl.jar .
ls -l

 
