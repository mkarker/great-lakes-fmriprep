#!/bin/bash
 
subjects=$(cat my_subjects.txt)
 
for subject in $subjects ; do
	# Set the variables here
	MY_SUBJECT_NUMBER=${subject}
	MY_JOB_NAME=${MY_SUBJECT_NUMBER}
 
	cp batch_file.sbat ${MY_JOB_NAME}.sbat
	# sed converts strings in files with this
	sed -i "s/MY_SUBJECT_NUMBER/${MY_SUBJECT_NUMBER}/;
     	s/MY_JOB_NAME/${MY_JOB_NAME}/" ${MY_JOB_NAME}.sbat
 
	egrep ${MY_JOB_NAME} ${MY_JOB_NAME}.sbat
 
	sbatch ${MY_JOB_NAME}.sbat
	sleep 1
 
done