#!/bin/bash
FILE="./ch$1_prop$2.ps"
CHAP=$(echo $1 | sed 's/^0*//')
PROP=$(echo $2 | sed 's/^0*//')

if [ ! -e "$FILE" ]; then
	cat > "$FILE" <<EOF
%!PS-Adobe-3.0 EPSF-3.0
%%BoundingBox: 0 0 100 100
%%BeginProlog
/Times-Roman findfont 3 scalefont setfont
%%EndProlog
36 90 moveto (Chapter $CHAP, Proposition $PROP) show

0.1 setlinewidth
1 setlinejoin



showpage
%%EOF
EOF
else
	echo "File $FILE already exists. Not overwriting."
fi
