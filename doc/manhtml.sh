#!/bin/sh
# file: manhtml		G. Moody	18 October 1996
#
# This script uses `rman' to convert man pages to HTML pages, with
# hyperlinked cross-references.

case $# in
 0|1) echo usage: $0 html-dir manpage-filename; exit ;;
esac

D=$1
shift

for FILENAME in $*
do
  T=`echo $FILENAME | cut -d. -f1`	# title
  t=`echo $T | cut -c1-6`
  S=`echo $FILENAME | cut -d. -f2`	# section

  echo -n "$FILENAME ... "
  rman -fHTML -l "%s(%s)" -r "%6s-%s.htm" $T.$S >$D/$t-$S.htm
  echo $t-$S.htm
done