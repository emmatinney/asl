#!/bin/bash
#SBATCH --job-name=asl
#SBATCH --time=24:00:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G

module load fsl/6.0.6.2

STUDY=/work/cnelab/TECHS/MRI/preprocessed_data/asl
BIDS=/work/cnelab/TECHS/MRI/BIDS
T1=/work/cnelab/TECHS/MRI/preprocessed_data/anat
while read subj
#make some directories
    unset LD_LIBRARY_PATH
    mkdir ${STUDY}/${subj}_pre
#copy files from bids
    cp -rf ${BIDS}/${subj}_pre/perf ${STUDY}/sub-01_pre
do 
#first preprocess T1 using fsl_anat
    fsl_anat -i ${BIDS}/${subj}_pre/anat/*.nii.gz -o ${T1}/${subj}_pre
    #echo ${subj}
done < ${STUDY}/subj.txt