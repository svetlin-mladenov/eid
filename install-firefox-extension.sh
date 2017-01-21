#!/bin/bash

# http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts
# http://stackoverflow.com/questions/2222150/extraction-of-data-from-a-simple-xml-file

set -e

mkdir -p extensions
cd extensions
wget "$1"
unzip *.xpi -d ext
rm *.xpi
ID=`grep "<em:id>" ext/install.rdf | head -1 | cut -f2 -d">" | cut -f1 -d"<"`
EXT_DIR="/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
mv ext "$EXT_DIR/$ID"
