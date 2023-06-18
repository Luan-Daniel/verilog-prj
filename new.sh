#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Error: expected a directory path as argument"
	exit 1
fi

newdir=$1
mkdir -p $newdir/{src,prj,sim,doc}