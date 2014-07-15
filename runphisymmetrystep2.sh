#! /bin/bash 
#
# yet another glue script to run phisymmetry calibration
# 
# This one will: 
#    1. Call  makephisym to setup the area
#    2. Use crab to run the calibration step 1
#    3. Run step 2
#
# See usage for instructions
#

crabcfg=phisym-cfg.crab.cfg
datadir=$CMSSW_BASE/src/Calibration/EcalCalibAlgos/data
step2out="CalibHistos.root ehistos.root etsumMean_barl.dat etsumMean_endc.dat PhiSymmetryCalibration_miscal_resid.root PhiSymmetryCalibration.root etsummary_barl.dat etsummary_endc.dat" 

usage(){
    echo "$0 mode dataset group firstrun lastrun globaltag"
    exit
}

if [ $# -ne 6 ] 
then
    usage
fi

mode=$1
dataset=$2
group=$3
firstrun=$4
lastrun=$5
globaltag=$6

. phisym-functions.sh

#cd into last made dir .. ok think of something smarter
rundir="$dataset"_"$firstrun"_"$lastrun"
rundir=`echo $rundir | sed s-/-_-g | sed 's/.\(.*\)/\1/'`
echo "$0 : Running dir is $rundir"
cd  $rundir

findcrabdir

echo "$0: jobs done,  process step 2"
#crab is done, run step 2

i="res" #this is what function dostep2 calls the output dir
dostep2

echo "$0 Done at `date`. Results in $rundir/$i"
