#!/bin/bash

# As this was run on the ATLAS cluster, we were able to automatically retrieve
# the LIGO data files via the LIGO_DATAFIND_SERVER environment variable.
# To run on any other computer, download the requisite files from GWOSC
# then replace the FRAMES variable below with:
# FRAMES='--frame-files H1:{H1_FILENAME.gwf} L1:{L1_FILENAME.gwf}'
# where H1_FILENAME and L1_FILENAME.gwf are the names of the files you
# downloaded.
export LIGO_DATAFIND_SERVER="ldr.atlas.local:80"
export FRAMES="--frame-type H1:H1_LOSC_16_V1 L1:L1_LOSC_16_V1"
export CHANNELS="H1:H1:GWOSC-16KHZ_R1_STRAIN L1:L1:GWOSC-16KHZ_R1_STRAIN"

# trigger parameters
TRIGGER_TIME=1130222530.007

# data to use
# the longest waveform covered by the prior must fit in these times
SEARCH_BEFORE=110
SEARCH_AFTER=18

# use an extra number of seconds of data in addition to the data specified
PAD_DATA=8

# PSD estimation options
PSD_ESTIMATION="H1:median L1:median"
PSD_INVLEN=8
PSD_SEG_LEN=16
PSD_STRIDE=8
PSD_DATA_LEN=512

# sampler parameters
CONFIG_PATH=inference.ini
OUTPUT_PATH=inference.hdf
IFOS="H1 L1"
SAMPLE_RATE=4096
F_HIGHPASS=15
F_LOW=20
PROCESSING_SCHEME=cpu

# the following sets the number of cores to use; adjust as needed to
# your computer's capabilities
NPROCS=700

# get coalescence time as an integer
TRIGGER_TIME_INT=${TRIGGER_TIME%.*}

# start and end time of data to read in
GPS_START_TIME=$((TRIGGER_TIME_INT - SEARCH_BEFORE - PSD_INVLEN))
GPS_END_TIME=$((TRIGGER_TIME_INT + SEARCH_AFTER + PSD_INVLEN))

# start and end time of data to read in for PSD estimation
PSD_START_TIME=$((TRIGGER_TIME_INT - PSD_DATA_LEN/2))
PSD_END_TIME=$((TRIGGER_TIME_INT + PSD_DATA_LEN/2))

# Running with OMP_NUM_THREADS=1 stops lalsimulation
# from spawning multiple jobs that would otherwise be used
# by inference and cause a reduced runtime.
export OMP_NUM_THREADS=1

# To do this analysis, we use mpi. This requires mpi4py and schwimmbad to be
# installed, both of which can be done with pip. The hosts file is a text file
# specifying which nodes to use and how many cores. It has format:
# nodename slots=X.
/usr/bin/mpirun \
--np $((NPROCS + 1)) \
--hostfile hosts \
-x PATH \
-x OMP_NUM_THREADS \
-x LIGO_DATAFIND_SERVER \
pycbc_inference --verbose \
    --seed 3310 \
    --instruments ${IFOS} \
    --gps-start-time ${GPS_START_TIME} \
    --gps-end-time ${GPS_END_TIME} \
    --channel-name ${CHANNELS} \
    ${FRAMES} \
    --strain-high-pass ${F_HIGHPASS} \
    --pad-data ${PAD_DATA} \
    --psd-estimation ${PSD_ESTIMATION} \
    --psd-start-time ${PSD_START_TIME} \
    --psd-end-time ${PSD_END_TIME} \
    --psd-segment-length ${PSD_SEG_LEN} \
    --psd-segment-stride ${PSD_STRIDE} \
    --psd-inverse-length ${PSD_INVLEN} \
    --low-frequency-cutoff ${F_LOW} \
    --sample-rate ${SAMPLE_RATE} \
    --config-file ${CONFIG_PATH} \
    --output-file ${OUTPUT_PATH} \
    --processing-scheme ${PROCESSING_SCHEME} \
    --nprocesses ${NPROCS} \
    --use-mpi \
    --force
