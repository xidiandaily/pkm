#/bin/bash
file=$1
cd pkm
echo $file | perl log2html.pl
