#!/bin/bash

# $1 id
# $2 filename
# $3 path
# $4 plugin
# $5 url

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
function echodate() { echo `date +%y/%m/%d-%H:%M:%S`:: $*; }

SRC=$3
DST=$(urldecode "$SRC")

echodate $(basename "$SRC") "->" $(basename "$DST") >> urldecode.log
mv "$SRC" "$DST"
