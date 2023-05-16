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

unset LD_LIBRARY_PATH
subj=05
#ANAT=/work/cnelab/TECHS/MRI/preprocessed_data/anat/sub-${subj}/sub-${subj}_pre/fsl.anat
#MASK=${T1}/sub-${subj}/sub-${subj}_pre/fsl.anat.anat/first_results
#while read subj
#make some directories
#    mkdir ${STUDY}/sub-06_pre
#copy files from bids
#    cp -rf ${BIDS}/sub-${subj}/ses-pre/perf/* ${STUDY}/sub-${subj}/sub-${subj}_pre
#do 
#first preprocess T1 using fsl_anat
  #  fsl_anat -i ${BIDS}/sub-${subj}/ses-pre/anat/*.nii.gz -o ${T1}/sub-${subj}_pre/
#copy files from bids to preprocessing dir
#    cp ${BIDS}/sub-${subj}/ses-pre/perf/sub-${subj}_ses-pre_pcasl_multidelay_perf.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre
#   fslsplit ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}_ses-pre_pcasl_multidelay_perf.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}
#   fslmerge -a ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}_pcasl_multidelay_perf.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0002.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0003.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0004.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0005.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0006.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0007.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0008.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0009.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}001* ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}002*
#    mv ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}0000.nii.gz ${STUDY}/sub-${subj}/sub-${subj}_pre/m0.nii.gz
#    oxford_asl -i ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}_pcasl_multidelay_perf.nii.gz --iaf tc --ibf tis --casl --bolus 1.5 --rpts 2,2,2,3,3 --tis 2.0,2.5,3.0,3.5,4.0 --fslanat ${T1}/sub-${subj}/sub-${subj}_pre/fsl.anat.anat -c ${STUDY}/sub-${subj}/sub-${subj}_pre/m0.nii.gz --cmethod single --tr 4.1 --cgain 1 --tissref csf --t1csf 4.3 --t2csf 750 --t2bl 150 --te 36.48 -o ${STUDY}/sub-${subj}/sub-${subj}_pre/basil_basic --bat 1.3 --t1 1.3 --t1b 1.65 --alpha 0.85 --spatial --fixbolus --mc --region-analysis --senscorr
#    echo ${subj}
#done < ${STUDY}/subj.txt

#${MASK}/T1_first-L_Accu_corr.nii.gz, ${MASK}/T1_first-L_Amyg_corr.nii.gz, ${MASK}/T1_first-L_Caud_corr.nii.gz, ${MASK}/T1_first-L_Hipp_corr.nii.gz, ${MASK}/T1_first-L_Pall_corr.nii.gz, ${MASK}/T1_first-L_Puta_corr.nii.gz, ${MASK}/T1_first-L_Thal_corr.nii.gz, ${MASK}/T1_first-R_Accu_corr.nii.gz, ${MASK}/T1_first-R_Amyg_corr.nii.gz, ${MASK}/T1_first-R_Caud_corr.nii.gz, ${MASK}/T1_first-R_Hipp_corr.nii.gz, ${MASK}/T1_first-R_Pall_corr.nii.gz, ${MASK}/T1_first-R_Puta_corr.nii.gz, ${MASK}/T1_first-R_Thal_corr.nii.gz


#if registration is bad, you can add -m flag to add a mask from native space. 
#FAST for bias correction: 
#fast --type=2 -B -o ${STUDY}/sub-${subj}/sub-${subj}_pre/m0+fastbc m0.nii.gz
#BET to skull strip the bias corrected image + output the brain mask
#bet ${STUDY}/sub-${subj}/sub-${subj}_pre/m0+fastbc_restore.nii.gz ${BIDS}/sub-${subj}/ses-pre/m0+fastbc_restore+betFF0p6 -m -n -v -F -f 0.6’
#then add the -m flag to the oxford asl command
#oxford_asl -i ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}_pcasl_multidelay_perf.nii.gz --iaf tc --ibf tis --casl --bolus 1.5 --rpts 2,2,2,3,3 --tis 2.0,2.5,3.0,3.5,4.0 --fslanat ${T1}/sub-${subj}/sub-${subj}_pre/fsl.anat.anat -c ${STUDY}/sub-${subj}/sub-${subj}_pre/m0.nii.gz --cmethod single --tr 4.1 --cgain 1 --tissref csf --t1csf 4.3 --t2csf 750 --t2bl 150 --te 36.48 -o ${STUDY}/sub-${subj}/sub-${subj}_pre/basil_basic --bat 1.3 --t1 1.3 --t1b 1.65 --alpha 0.85 --spatial --fixbolus --mc --region-analysis --senscorr -m ${STUDY}/sub-${subj}/sub-${subj}_pre/m0+fastbc_restore+betFF0p6_mask.nii.gz

oxford_asl -i  ${STUDY}/sub-${subj}/sub-${subj}_pre/sub-${subj}_pcasl_multidelay_perf.nii.gz --iaf tc --ibf tis --casl --bolus 1.5 --rpts 2,2,2,3,3 --tis 2,2.5,3,3.5,4 --fslanat  ${T1}/sub-${subj}/sub-${subj}_pre/fsl.anat.anat -c ${STUDY}/sub-${subj}/sub-${subj}_pre/m0.nii.gz --cmethod single --tr 4.1 --cgain 1 --tissref csf --t1csf 4.3 --t2csf 750 --t2bl 150 --te 36.48 -o ${STUDY}/sub-${subj}/sub-${subj}_pre/basil_basic_mask -m ${STUDY}/sub-${subj}/sub-${subj}_pre/m0+fastbc_restore+betFF0p6_mask.nii.gz --bat 1.3 --t1 1.3 --t1b 1.65 --alpha 0.85 --spatial --fixbolus --mc –artoff
