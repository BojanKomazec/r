# iris.csv downloaded from
# https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/iris.csv and use it.

options(echo=TRUE) # if you want see commands in output file
args <- commandArgs(trailingOnly = TRUE)
iris_db_path <- args[1]
print(iris_db_path)

library(h2o)
h2o.init(nthreads = -1)
# "/home/bojan/Downloads/Enterprise AI/iris.csv"

# importFile calls http://localhost:54321/3/ImportFiles?path=iris.csv&pattern=
train.hex <- h2o.importFile("iris.csv")
splits <- h2o.splitFrame(train.hex, 0.75, seed=1234)
train.x <- setdiff(colnames(train.hex), c("Petal.Length","C1"))
train.y <- "Petal.Length"
dl <- h2o.deeplearning(x=train.x , y=train.y,
                       training_frame=splits[[1]],
                       distribution="quantile", quantile_alpha=0.8)
h2o.predict(dl, splits[[2]])