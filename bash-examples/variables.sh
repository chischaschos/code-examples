#!/usr/bin/bash
BLA=asdfjasdf

BLA2="$BLA . asdf"
BLA3=${BLA}asdf

echo $BLA
echo $BLA2
echo $BLA3

# no spaces between LH and RH
v1="123"

# the spaces on the left will be included
v2="asdf\
  123\
  456\
  asdf"

echo $v1
echo $v2

# or heredocs http://tldp.org/LDP/abs/html/here-docs.html
cat <<-mytabssupressednotspaces
  sdf
	tabignored
mytabssupressednotspaces

# or storing to a variable, https://ss64.com/bash/read.html
read -r -d '' VAR <<-EOM
This is line 1.
This is line 2.
	Line 3.
EOM

echo $VAR
