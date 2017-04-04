library(h2o)

#Start H2O on your local machine using all available cores.
#By default, CRAN policies limit use to only 2 cores.
h2o.init(nthreads = -1)

#Show a demo
print ("Demo: Generalized Linear Models (GLM)")
demo(h2o.glm)

readline(prompt="Press [ENTER] to continue...")
print ("Demo: Generalized Boosted Models (GLM)")
demo(h2o.gbm)

readline(prompt="Press [ENTER] to continue...")
print ("Demo: Deep Learning")
demo(h2o.deeplearning)
