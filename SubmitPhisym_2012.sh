#!/bin/sh

cp json_$1_$2.txt jsonls-alcaphisym.txt  
./runphisymmetry2.sh caf /AlCaPhiSym/Run$3-v1/RAW Collisions12 $1 $2 $4
