dat = read.csv(file.choose())
head(dat)
model = glm(got_A~univ_GPA+hours_study,data=dat)
summary(model)
dat$new =predict(model,dat)
actual      <- factor( ifelse(dat$got_A > threshold, "yes", "no") )

probsTest <- predict(model, dat, type = "response")
threshold <- 0.5
pred      <- factor( ifelse(probsTest > threshold, "yes", "no") )
pred      <- relevel(pred, "yes")   # you may or may not need this; I did
library(caret)
install.packages("e1071")
confusionMatrix(pred, actual)

