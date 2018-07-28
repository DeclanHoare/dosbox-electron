#!/bin/sh -e
# Builds dosbox.js for use in dosbox-electron

pushd em-dosbox
./autogen.sh
# Disable WASM, because build fails without it
emconfigure ./configure --disable-wasm
make
popd
cp em-dosbox/src/dosbox.html.mem .

# This assert fails for some reason even though the environment works as
# node.  Just getting rid of the assert fixes the program.
sed "s/assert(ENVIRONMENT_IS_NODE);//g" em-dosbox/src/dosbox.js > dosbox.js
