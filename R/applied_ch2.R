install.packages('ISLR')
library(ISLR)
data(College)

##Book recommends these commands if loading from .csv
##rownames(College)=College[,1]
##**Error: duplicate row.names not allowed**
##row names are already factors

##Also unnecessary 
##College = College[,-1]
##fix(College)

##Check data matches book
head(College)
College[1:5, c(1,2,3)]
rownames(College)[1:10]

#Part C

##Use the summary() function
summary(College)

##Use the pairs() fxn to produce a scatterplot matrix of the first ten columns
pairs(College[,1:10])
##Same, but more fun. Dynamic generation of formula
xnam <- paste0("College[,", 1:10,"]")
fmla <- as.formula(paste("~", paste(xnam, collapse= "+")))
pairs(fmla)

##Determine whether >=50% of students at a given U. are from top 10% of their highschool class
Elite <- rep("No", nrow(College))
Elite[College$Top10perc > 50] = "Yes"
College$Elite <- as.factor(Elite)
##Extra credit, print names of colleges with smarty pants-student bodies
College$Names <- rownames(College)
smarty_pants <- College[College$Elite=="Yes", "Names"]
smarty_pants

##Extra credit, predict room.board
library(e1071)
train <- College[1:(nrow(College)-nrow(College)/3),]
test <- College[(nrow(train)+1):nrow(College),]
nrow(test) + nrow(train) == nrow(College)

svm.model <- svm(Room.Board~Private+PhD+Top10perc, data=train)
svm.pred <- predict(svm.model, test)
#pretty ok job
cat("Error for U of Chicago $", (College[College$Names=="University of Chicago","Room.Board"] - svm.pred["University of Chicago"]))

