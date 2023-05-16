Preprocessing ASL using BASIL in FSL

Command to open basil gui from command line: asl_gui
Our data has 26 volumes. First one is calibration scan, 2nd is junk, 24 are ASL
M0 and multi delay pcasl
Fslsplit will split up volumes into 26 volumes
fslsplit sub-Pilot_acq-pcaslTgseMultidelay_dir-AP_1_asl_acq.nii.gz sub-Pilot_1
Then you use FSLmerge to concatenate the volumes 2-26 
fslmerge -a sub-Pilot_1_md_pcasl sub-Pilot_10002.nii.gz sub-Pilot_10003.nii.gz sub-Pilot_10004.nii.gz sub-Pilot_10005.nii.gz sub-Pilot_10006.nii.gz sub-Pilot_10007.nii.gz sub-Pilot_10008.nii.gz sub-Pilot_10009.nii.gz sub-Pilot_1001* sub-Pilot_1002*
Not high resolution, 1.5 seconds “tagging” units
In gui
First tab put in multiple delay pcasl, last 24 volumes
5 pulse labeling delay
Repeats- variable (2 for first 3, than 3)
Volumes grouped by: post labeling delay, TI/PLDs
Label/control paring- labeling then control 
Labeling- pcasl
Bolas duration- constant, 1.5 seconds
0.3 0.8 1.3 1.8 2.3
2 2. 2 3 3 
3D log 
Next —> update and load images
Structural data
Run FSL_ANAT, T1 in bids directory 
Independent structural data ?? 
Freesurfer/mri/T1.mgz
Transfer to standard, freesurfer/transforms/ 
Look at freesurfer documentation — nonlinear warping to map into space

Registration will automatically go
Enable calibration, M0
M0 type- proton density 
Sequence TR- 4.1 seconds
Calibration gain- stays as is
Calibration mode- reference region
Type- CSF
If using freesurfer- use mask but if not fsl anat will pick
Reference T1- 
sequence TE- 36
No distortion correction
Analysis- enter output directory
Multi delay better accuracy in transit time and better accuracy of CBF volume
Analysis options- adaptive, fix label duration, motion correction

Code: oxford_asl -i /Users/emmatinney/Downloads/ASL/sub-Pilot_1_md_pcasl.nii.gz --iaf tc --ibf tis --casl --bolus 1.5 --rpts 2,2,2,3,3 --tis 1.8,2.3,2.8,3.3,3.8 --fslanat /Users/emmatinney/Downloads/ASL/struc.anat -c /Users/emmatinney/Downloads/ASL/M0.nii.gz --cmethod single --tr 4.1 --cgain 1 --tissref csf --t1csf 4.3 --t2csf 750 --t2bl 150 --te 36 -o /Users/emmatinney/Downloads/ASL --bat 1.3 --t1 1.3 --t1b 1.65 --alpha 0.85 --spatial --fixbolus --mc --artoff --exch spa --disp sgauss
