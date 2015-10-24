#  How the script "run_analysis.R" works

		1) Reads the files 'X_train.txt' and 'X_test.txt' ,containing data about measurements, in train_DF 
		   and test_DF respectively
		2) Reads the 'features.txt' to know the names of the 561 features in  features_DF dataframe
		3) Read the description of the 6 activities from 'activity_labels.txt' in activities_DF dataframe  
		4) Read the data on activities(on measurements in step 1 above) from 'y_train.txt' and 'y_test.txt'
		   and save in train_ACT_DF and test_ACT_DF
		5) Read the data about Subjects from (on measurements in step 1 above) from 'subject_train.txt' and 
		   subject_test.txt in train_SUB_DF,test_SUB_DF

		6) Append/Merge the data in train_DF and test_DF dataframes in tot_DF dataframe using rbind
		7) Add column names to the merged dataframe tot_DF ,by taking column names  from features_DF dataframe 

		8) Extract column indexes from features_DF which has 'mean' or 'std' in their column names,
		   using grep command
		9) Extract the columns based on indexes from step 8 in tot_DF data frame
		10)Append/Merge the activity data in train_ACT_DF and test_ACT_DF dataframes in tot_ACT_DF dataframe 
		   using rbind
		11) Assign string values to activity factors  in ftot_ACT_DF
		12) Create a matrix act_matrix using ftot_ACT_DF with column name "ActivityName"
		13) Append/Merge the Subject data in train_SUB_DF and test_SUB_DF dataframes in tot_SUB_DF dataframe 
		    using rbind     
		14) Add column name of "SubjectID" to the column in tot_SUB_DF
		15) Merge tot_SUB_DF,act_matrix and tot_DF  in merged_DF  using cbind 
		16) Now using the reshape2 packages melt and dcast to create the required tidy dataset tidyDataset_DF 
		17) Write the 'tidyDataset_DF' to a file 
		18) Remove the objects to free up the memory using rm command



#  Running the script in Rstudio on Windows

#   Assumptions :
	  	a) RStudio is properly installed on your system 
	    b) This script requires 'reshape2' package pre installed 
	      
#   Instructions :

	  	1) Open RStudio and check your working directory by running getwd() command in RStudio
	  	2) Copy the "UCI HAR Dataset" folder of the Samsung data to your working folder
	  	3) Copy the "run_analysis.R" file in the working directory from step 1
	  	4) In Rstudio, open the  "run_analysis.R" file, now press "Ctrl+Shift+S" to source and run the script
	  	5) In RStudio R console you will see that the script is sourced and running like below, 
	  	    > source('C:/<workingDir>/run_analysis.R')
	  	6) Wait till the RStudio R Console is back with the prompt as below
	  	    > source('C:/<workingDir>/run_analysis.R')
	  	    >
	  	7) The script will create a new file named "TidyDataSet.txt" in  "UCI HAR Dataset" folder in your working directory