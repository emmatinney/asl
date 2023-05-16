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
#while read subj
subj=03
#make some directories
    unset LD_LIBRARY_PATH
 #   mkdir ${STUDY}/sub-${subj}
 #  mkdir ${STUDY}/sub-${subj}/sub-${subj}_pre
 #  mkdir ${T1}/sub-${subj}
 #   mkdir ${T1}/sub-${subj}/sub-${subj}_pre/
 #   mkdir ${T1}/sub-${subj}/sub-${subj}_pre/fsl.anat
#copy files from bids
  #  cp -rf ${BIDS}/sub-${subj}/ses-pre/perf/* ${STUDY}/sub-${subj}/sub-${subj}_pre
     cp -rf ${BIDS}/sub-${subj}/ses-post/anat ${T1}/sub-${subj}/sub-${subj}_post  
#do 
#first preprocess T1 using fsl_anat

    fsl_anat -i ${BIDS}/sub-${subj}/ses-post/anat/*.nii.gz -o ${T1}/sub-${subj}/sub-${subj}_post/fsl.anat --nocrop 
#    echo ${subj}
#done < ${STUDY}/subj.txt