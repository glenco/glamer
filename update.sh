#!/bin/sh

SLSIMLIB="https://github.com/glenco/SLsimLib.git"
COSMOLIB="https://github.com/glenco/CosmoLib.git"
NR="https://github.com/glenco/NR.git"

echo "Updating 'GLAMER'..."
git pull

if [ -d "NR" ]; then
    echo "Updating 'NR'..."
    cd NR
    git pull
    cd ..
else
    git clone $NR NR
fi

if [ -d "CosmoLib" ]; then
    echo "Updating 'CosmoLib'..."
    cd CosmoLib
    git pull
    cd ..
else
    git clone $COSMOLIB CosmoLib
fi

if [ -d "SLsimLib" ]; then
    echo "Updating 'SLsimLib'..."
    cd SLsimLib
    git pull
    cd ..
else
    git clone $SLSIMLIB SLsimLib
fi
