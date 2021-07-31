# Peer-graded Assignment: Getting and Cleaning Data Course Project
Submission by Yaxin Zhang


# Assignment details:
#####
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####


###
# Identifiers
###
* functions - type of measurement taken, header values
* num - function id within the file, numerical value
* activity - action performed within the study
* id - activity id within the file, numerical value
* subject - id entry of the subject


###
# Variables
###
* The below 8 variables all are direct data imports from the TXT file extracted from the ZIP folder, provided by the course. 
* features
* activity_label 
* subject_test 
* x_test 
* y_test 
* subject_train 
* x_train 
* y_train 


* subject_all - merge of test and train files for subjects
* features_all - merge of test and train files for features (x)
* activity_all - merge of test and train files for activity (y)
* data_all - the full data, from which data massaging functions are run against for the final tidy data extract


* mean_std_getid - stores the column indices matching "mean" or "std" 
* mean_std_getid_final - used to store the concactenated mean_std_getid with the subject and activity columns
* mean_std_data_extract - subset of data based on column indices in mean_std_getid_final


* col_num - total number of columns in mean_std_data_extract
* final_tidydata_set - final tidy data set with the average of each variable for each activity and subject


###
# Columns
###
* "Acc" renamed to "Accelerometer"
* "Gyro" renamed to "Gyroscope"
* "BodyBody" truncated to "Body"
* "Mag" renamed to "Magnitude"
* "tBody" renamed to "TimeBody"
* "-mean()" renamed to "Mean"
* "-std()" renamed to "STD"
* "-freq()" renamed to "Frequency"
* "angle" renamed to "Angle"
* "gravity" renamed to "Gravity"
* beginning "f" renamed to "Frequency"
* beginning "t" renamed to "Time"

"activity"                                          
"subject"                                          
"TimeBodyAccelerometerMean()-X"                     
"TimeBodyAccelerometerMean()-Y"                    
"TimeBodyAccelerometerMean()-Z"                     
"TimeBodyAccelerometerSTD()-X"                     
"TimeBodyAccelerometerSTD()-Y"                      
"TimeBodyAccelerometerSTD()-Z"                     
"TimeGravityAccelerometerMean()-X"                  
"TimeGravityAccelerometerMean()-Y"                 
"TimeGravityAccelerometerMean()-Z"                  
"TimeGravityAccelerometerSTD()-X"                  
"TimeGravityAccelerometerSTD()-Y"                   
"TimeGravityAccelerometerSTD()-Z"                  
"TimeBodyAccelerometerJerkMean()-X"                 
"TimeBodyAccelerometerJerkMean()-Y"                
"TimeBodyAccelerometerJerkMean()-Z"                 
"TimeBodyAccelerometerJerkSTD()-X"                 
"TimeBodyAccelerometerJerkSTD()-Y"                  
"TimeBodyAccelerometerJerkSTD()-Z"                 
"TimeBodyGyroscopeMean()-X"                         
"TimeBodyGyroscopeMean()-Y"                        
"TimeBodyGyroscopeMean()-Z"                         
"TimeBodyGyroscopeSTD()-X"                         
"TimeBodyGyroscopeSTD()-Y"                          
"TimeBodyGyroscopeSTD()-Z"                         
"TimeBodyGyroscopeJerkMean()-X"                     
"TimeBodyGyroscopeJerkMean()-Y"                    
"TimeBodyGyroscopeJerkMean()-Z"                     
"TimeBodyGyroscopeJerkSTD()-X"                     
"TimeBodyGyroscopeJerkSTD()-Y"                      
"TimeBodyGyroscopeJerkSTD()-Z"                     
"TimeBodyAccelerometerMagnitudeMean()"              
"TimeBodyAccelerometerMagnitudeSTD()"              
"TimeGravityAccelerometerMagnitudeMean()"           
"TimeGravityAccelerometerMagnitudeSTD()"           
"TimeBodyAccelerometerJerkMagnitudeMean()"          
"TimeBodyAccelerometerJerkMagnitudeSTD()"          
"TimeBodyGyroscopeMagnitudeMean()"                  
"TimeBodyGyroscopeMagnitudeSTD()"                  
"TimeBodyGyroscopeJerkMagnitudeMean()"              
"TimeBodyGyroscopeJerkMagnitudeSTD()"              
"FrequencyBodyAccelerometerMean()-X"                
"FrequencyBodyAccelerometerMean()-Y"               
"FrequencyBodyAccelerometerMean()-Z"                
"FrequencyBodyAccelerometerSTD()-X"                
"FrequencyBodyAccelerometerSTD()-Y"                
"FrequencyBodyAccelerometerSTD()-Z"                
"FrequencyBodyAccelerometerMeanFreq()-X"            
"FrequencyBodyAccelerometerMeanFreq()-Y"           
"FrequencyBodyAccelerometerMeanFreq()-Z"            
"FrequencyBodyAccelerometerJerkMean()-X"           
"FrequencyBodyAccelerometerJerkMean()-Y"            
"FrequencyBodyAccelerometerJerkMean()-Z"           
"FrequencyBodyAccelerometerJerkSTD()-X"             
"FrequencyBodyAccelerometerJerkSTD()-Y"            
"FrequencyBodyAccelerometerJerkSTD()-Z"             
"FrequencyBodyAccelerometerJerkMeanFreq()-X"       
"FrequencyBodyAccelerometerJerkMeanFreq()-Y"       
"FrequencyBodyAccelerometerJerkMeanFreq()-Z"       
"FrequencyBodyGyroscopeMean()-X"                    
"FrequencyBodyGyroscopeMean()-Y"                   
"FrequencyBodyGyroscopeMean()-Z"                    
"FrequencyBodyGyroscopeSTD()-X"                    
"FrequencyBodyGyroscopeSTD()-Y"                     
"FrequencyBodyGyroscopeSTD()-Z"                    
"FrequencyBodyGyroscopeMeanFreq()-X"                
"FrequencyBodyGyroscopeMeanFreq()-Y"               
"FrequencyBodyGyroscopeMeanFreq()-Z"                
"FrequencyBodyAccelerometerMagnitudeMean()"        
"FrequencyBodyAccelerometerMagnitudeSTD()"          
"FrequencyBodyAccelerometerMagnitudeMeanFreq()"    
"FrequencyBodyAccelerometerJerkMagnitudeMean()"     
"FrequencyBodyAccelerometerJerkMagnitudeSTD()"     
"FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()" 
"FrequencyBodyGyroscopeMagnitudeMean()"            
"FrequencyBodyGyroscopeMagnitudeSTD()"              
"FrequencyBodyGyroscopeMagnitudeMeanFreq()"        
"FrequencyBodyGyroscopeJerkMagnitudeMean()"         
"FrequencyBodyGyroscopeJerkMagnitudeSTD()"         
"FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()"     
"Angle(TimeBodyAccelerometerMean,Gravity)"         
"Angle(TimeBodyAccelerometerJerkMean),GravityMean)" 
"Angle(TimeBodyGyroscopeMean,GravityMean)"         
"Angle(TimeBodyGyroscopeJerkMean,GravityMean)"      
"Angle(X,GravityMean)"                             
"Angle(Y,GravityMean)"                              
"Angle(Z,GravityMean)"  