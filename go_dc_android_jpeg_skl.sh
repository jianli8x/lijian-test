#!/bin/bash
source setup_lib
COUNTER=0
CURRENT_ST=`date +%Y-%m-%d-%H-%M-%S`
LOGDIR="logs/decode_jpeg_skl_$CURRENT_ST/"
LOGFILE="$LOGDIR/decode_jpeg_skl.log"
mkdir -p logs
mkdir -p $LOGDIR
CUR_DIR=`pwd`
while [ $COUNTER -lt 1 ]; do
        date "+%Y-%m-%d %H:%M:%S.%N" >> $LOGFILE
        echo Test *@$CUR_DIR****************************No. $COUNTER******************************************** >> $LOGFILE
        let COUNTER=COUNTER+1
	./lucas -s scenarios/scenarios-SKL/decode_local/dec_jpeg_vaapi_djpeg_msu.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV -r all --logfile $LOGDIR/lucas_jpeg-`date +%H-%M-%S`.log >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10
        echo    >> $LOGFILE
done
touch $LOGDIR/test_jpeg-end-at-`date +%H-%M-%S`
echo "done."


