#!/bin/bash
FRICASGIT=~/devel/fricas.nilqed
FRICASBUILD=~/devel/fricas_build
cd $FRICASBUILD
mkdir abcl
mkdir abcl/algebra
mkdir abcl/lisp
mkdir abcl/interp
mkdir abcl/msgs

cp -v $FRICASBUILD/src/interp/*.clisp $FRICASBUILD/abcl/interp
cp -v $FRICASBUILD/src/interp/*.lisp  $FRICASBUILD/abcl/interp
cp -v $FRICASBUILD/src/algebra/*/*.lsp $FRICASBUILD/abcl/algebra
cp -v -r $FRICASBUILD/src/algebra/*.daase $FRICASBUILD/abcl/algebra
cp -v $FRICASBUILD/src/algebra/*.text $FRICASBUILD/abcl/algebra
cp -v $FRICASBUILD/src/lisp/*.lisp $FRICASBUILD/abcl/lisp

cp -v $FRICASGIT/src/interp/*.lisp $FRICASBUILD/abcl/interp
cp -v $FRICASGIT/src/share/doc/msgs/s2-us.msgs $FRICASBUILD/abcl/msgs
cp -v $FRICASGIT/contrib/abcl/fricas.lisp $FRICASBUILD/abcl
cp -v $FRICASGIT/contrib/abcl/abcl.jar $FRICASBUILD/abcl
cp -v $FRICASGIT/contrib/abcl/lisp/*.lisp $FRICASBUILD/abcl/lisp


# Rename interpreter *.clisp to *.lisp
cd $FRICASBUILD/abcl/interp
for a in *.clisp; do mv $a $(basename $a .clisp).lisp; done

# Compile algebra
cd $FRICASBUILD/abcl/algebra

CMPALG=$FRICASBUILD/abcl/lisp/compile-algebra.lisp
rm $CMPALG
echo ";;; Compile algebra: $(date)" >> $CMPALG
for a in *.lsp; do echo "(compile-file \"algebra/$a\")" >> $CMPALG ; done 
#
cd $FRICASBUILD/abcl
java -jar abcl.jar --load lisp/algcompile.lisp 
#


# Load FriCAS
cd $FRICASBUILD/abcl 
java -jar abcl.jar --load fricas.lisp











