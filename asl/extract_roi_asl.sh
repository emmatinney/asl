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
ASLCODE=/work/cnelab/code/asl

outputdir=/work/cnelab/TECHS/MRI/preprocessed_data/asl/${subj}/${subj}_pre/basil_basic/native_space
export FSLDIR=/path/to/fsl
export PATH=${FSLDIR}/bin:${PATH}
export FSLOUTPUTTYPE=NIFTI_GZ

#while read subj
#make some directories
    unset LD_LIBRARY_PATH

# Set input and output filenames
asl_file=/path/to/asl.nii.gz
brain_mask=/path/to/brain_mask.nii.gz
perfusion_file=/path/to/frontal_lobe_perfusion.nii.gz

# Use FSL to extract frontal lobe perfusion values

fslstats $outputdir/perfusion_calib.nii.gz -k $ASLCODE/harvardoxford-cortical_prob_Frontal_Pole.nii.gz -M > $perfusion_file   

done < ${STUDY}/subj.txt