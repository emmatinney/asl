#Preprocessing using EXPLORE ASL
https://exploreasl.github.io/Documentation/1.10.0/
Email Jan if you have issues:j.petr@hzdr.de
Explore asl is used through matlab. These instructions are how to use on the discovery cluster at Northeastern University.
- Open a matlab session. Set path to where you have Explore ASL downloaded. 
- to run explore asl, all you do is type ExploreASL('path to upper level MRI dir', 1, 0). The 1, 0 means you need to convert the dcm into nifty images. Even if your data is already in bids, explore asl has a specific format that it puts the nifty images in. If you have your data in nifty already, then you can format into explore asl's version of BIDS and type ExploreASL('path to upper level MRI dir', 0, 1). This means asl data is already in nifty and you don't need to run dcm2niix.
	- update 7/24/2024 i have actually used ExploreASL('/work/cnelab/TECHS/MRI', [1 1 0], 1) 
- before you run, you need to configure some .json files. I have included these json files in the GitHub. You also need to configure your files.
- your main folder with the raw dcm images should be titled "sourcedata". Inside sourcedata can be all your participant folders.
- the 3 json files you need are dataPar.json, sourcestructure.json, and studypar.json. these folders should be in the upper lever dir, the dir right above sourcedata.
- In dataPar.json, we set the dummyscan, we tell it to use Basil (FSL's version of ASL processing), we tell it where to find the FSL dir.
- in sourcestructure.json, we identify the sourcedata file structure. So, we are telling it where to find the ASL raw dir and the T1 raw dir.
- in studypar.json, we identify parameters of the asl sequence. We tell it the labeling duration, the post labeling delay, the M0 and dummy scan position, that our sequence is PCASL, and the order of the ASL labeling.
Outputs
-population folder contains normalized data to MNI template
Derivatives/ExploreASL/Population/ASLCheck/
	- images aligned to t1
	- _pWM check contours of white matter and CBF images
	- go through CBF (Tra_qCBF) images 
Derivatives/ExploreASL/Population/MotionASL
	- check images without motion and keep adding more volumes with more motion. quality will degrade with the rows
Derivatives/ExploreASL/Population/Stats/
	-results calculated for a given atlas 
	- CoV - co efficient of variation, when blood doesn't reach the brain 
	- mean CBF across all voxels
	- PVC 0 or PVC 2, with or without partial volume correction
Different atlases:
	- edit dataPar.json, add {"x":{
   	 "S": {"Atlases": 		["TotalGM","TotalWM","DeepWM","Hammers","HOcort_CONN","HOsub_CONN","Mindboggle_OASIS_DKT31_CMA"]}
}}
Delete /lock/xASL_module_population.
Run ExploreASL('/work/cnelab/TECHS/MRI', 0, [0 0 1]) - will rerun population module
