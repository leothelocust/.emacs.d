#!/bin/bash

TEXT=`cat`

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PLAIN=$(echo "$TEXT" | pandoc -f markdown -t plain )
HTML=$(echo "$TEXT" | pandoc -f markdown -t html )
# CSS=$(cat $DIR/mime.css )

#    <style>
#      $CSS
#    </style>

cat <<EOF
<#multipart type=alternative>
$PLAIN
<#part type=text/html>
<html>
  <head>
    <title></title>
  </head>
  <body>
    $HTML
  </body>
</html>
<#/multipart>
EOF
