#!/bin/bash
source setup_lib
COUNTER=0
CURRENT_ST=`date +%Y-%m-%d-%H-%M-%S`
LOGDIR="logs/decode_hevc_skl_$CURRENT_ST/"
LOGFILE="$LOGDIR/decode_hevc_skl.log"
mkdir -p logs
mkdir -p $LOGDIR
CUR_DIR=`pwd`
touch $LOGDIR/test_hevc_start_at-`date +%H-%M-%S`
while [ $COUNTER -lt 1 ]; do
        date "+%Y-%m-%d %H:%M:%S.%N" >> $LOGFILE
        echo    >> $LOGFILE
        echo Test *@$CUR_DIR****************************No. $COUNTER******************************************** >> $LOGFILE
        let COUNTER=COUNTER+1

	./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_LF_ALLEGRO.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_allegro_lf-`date +%H-%M-%S`.log -r all >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10

#	./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_SF_ALLEGRO.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_allegro_sf-`date +%H-%M-%S`.log -r all >> $LOGFILE
#        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
#        rm -fr temp/*
#        sync;sleep 10

	./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_LF_BBC.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_bbc_lf-`date +%H-%M-%S`.log -r all >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10
	
#        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_SF_BBC.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_bbc_sf-`date +%H-%M-%S`.log -r all >> $LOGFILE
#        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
#        rm -fr temp/*
#        sync;sleep 10

        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_LF_JVT.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_jvt_lf-`date +%H-%M-%S`.log -r all >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10

#        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_SF_JVT.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_jvt_sf-`date +%H-%M-%S`.log -r all >> $LOGFILE
#        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
#        rm -fr temp/*
#        sync;sleep 10

        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_LF_MSFT.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_msft_lf-`date +%H-%M-%S`.log -r all >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10

#        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/Decode_HEVC_SF_MSFT.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_hevc_msft_sf-`date +%H-%M-%S`.log -r all >> $LOGFILE
#        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
#        rm -fr temp/*
#        sync;sleep 10
        ./lucas -s scenarios/scenarios-SKL/decode_local/hevc/HEVC_BigRes_md5CK_Decode.csv --temp-dir-cleanup --scenario-safe-mode --loglevel info -o --scenario-raw-CSV --logfile $LOGDIR/lucas_bigresolution-`date +%H-%M-%S`.log -r all >> $LOGFILE
        mv temp/scenarios/scenarios-SKL/decode_local/hevc/*.csv $LOGDIR
        rm -fr temp/*
        sync;sleep 10


        echo    >> $LOGFILE
        date "+%Y-%m-%d %H:%M:%S.%N" >> $LOGFILE

done
touch $LOGDIR/test_hevc_end-at-`date +%H-%M-%S`
echo "===============================result checking====================================="
tail  $LOGDIR/lucas_hevc*.log
echo "- done -"
