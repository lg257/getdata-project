activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
A<-cbind(y_test,subject_test)
colnames(A)<-c("activity","subject")
B<-cbind(y_train,subject_train)
colnames(B)<-c("activity","subject")
C<-rbind(A,B) ##dim(C)=10299*2 combine activity and subject from "test"&"train"
D<-rbind(x_test,x_train)##dim(D)=10299*561 combine variables of "test" and "train"
features_unique<-make.unique(as.character(features[,2]))
colnames(D)<-features_unique     ##561 columns(variables) of D are features
library(dplyr) 
E<-select(D,contains("mean()"),contains("std()"))  #subset data by selecting features containing mean() & std() (dim-10299*66)
N<-cbind(C,E) #dim:10299*68 combine activity,subject and features(with only the measurements on the mean and standard deviation)
N1<-aggregate(N[,1:68],by=list(N$subject,N$activity),FUN=mean)
N2<-N1[,-(1:2)] #compute the average of variables,grouped according to subject and activity dim:180*68
for (i in 1:nrow(N2)){
  if (N2[i,1]==1){N2[i,1]=as.character(activity_labels[1,2])}
  if (N2[i,1]==2){N2[i,1]=as.character(activity_labels[2,2])}  
  if (N2[i,1]==3){N2[i,1]=as.character(activity_labels[3,2])}
  if (N2[i,1]==4){N2[i,1]=as.character(activity_labels[4,2])}
  if (N2[i,1]==5){N2[i,1]=as.character(activity_labels[5,2])}
  if (N2[i,1]==6){N2[i,1]=as.character(activity_labels[6,2])}
} #use iteration method to replace activity numbers with activity labels

write.table(N2,file="getdata project.txt",row.name=FALSE)
# use write.table to get a text file from the above Data Frame.Submit this text file for Question 1 of Assessment
