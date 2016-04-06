

X_train <- read.table("train/X_train.txt", quote="\"", comment.char="")
X_test <- read.table("test/X_test.txt", quote="\"", comment.char="")

featNames <- read.table("features.txt", quote="\"", comment.char="") 

a <- grep( "-mean\\(\\)|-std\\(\\)", featNames$V2 )


X_merged <- data.frame(matrix(ncol = length(a), nrow = nrow(X_train) + nrow(X_test)))

ii <- 1
for (i in a)
{
  merged_column <- c( X_train[,i], X_test[,i]) 
  X_merged[,ii] <-  merged_column
  ii <- ii+1
}

names(X_merged) <- featNames[a,2]

write.table(X_merged, file = "X_merged.txt", row.names = FALSE)