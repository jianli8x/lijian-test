#!/bin/bash
source setup_lib
COUNTER=0
CURRENT_ST=`date +%Y-%m-%d-%H-%M-%S`
LOGDIR="logs/decode_avc_skl_$CURRENT_ST/"
LOGFILE="$LOGDIR/decode_avc_skl.log"
CUR_DIR=`pwd`
mkdir -p logs
mkdir -p $LOGDIR

while [ $COUNTER -lt 1 ]; do
        date "+%Y-%m-%d %H:%M:%S.%N" >> $LOGFILE
        echo Test *@$CUR_DIR******No. $COUNTER******************************************** >> $LOGFILE
        let COUNTER=COUNTER+1
	./lucas -s scenarios/scenarios-SKL/decode_local/avc/android-cts-media.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --logfile $LOGDIR/lucas_avc_android-cts-media-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/ITU_Baseline_Extended_Main.csv --scenario-safe-mode --temp-dir-cleanup --loglevel info -o --scenario-raw-CSV -r all --logfile $LOGDIR/lucas_avc_ITU_baseline_Extended_Main-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
	sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/ITU_FRExt_High.csv --scenario-safe-mode --temp-dir-cleanup --loglevel info -o --scenario-raw-CSV -r all --logfile $LOGDIR/lucas_avc_ITU_FRExt_High-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
	sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/VClips.csv --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --temp-dir-cleanup --logfile $LOGDIR/lucas_avc_VClips-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
	sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/Allegro_long.csv --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --temp-dir-cleanup --logfile $LOGDIR/lucas_avc_Allegro_long-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
	sync;sleep 10
#        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/Allegro_short.csv --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --temp-dir-cleanup --logfile $LOGDIR/lucas_avc_Allegro_short-`date +%H-%M-%S`.log >> $LOGFILE
#        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
#        rm -fr temp/*
#	sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/avc/avc_4k_decode.csv --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --temp-dir-cleanup --logfile $LOGDIR/lucas_avc_4k_decode-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/avc/*.csv $LOGDIR
        rm -fr temp/*
	sync;sleep 10
        #./lucas -s scenarios/driver_dec_test/h264/PhaseError.csv --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --temp-dir-cleanup --logfile $LOGDIR/lucas_avc_PhaseError-`date +%H-%M-%S`.log >> $LOGFILE
        #mv temp/scenarios/driver_dec_test/h264/*.csv $LOGDIR
        #rm -fr temp/*
        echo    >> $LOGFILE
done
touch $LOGDIR/test_avc-end-at-`date +%H-%M-%S`
