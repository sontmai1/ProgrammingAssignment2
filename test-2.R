source("cachematrix.R")


# Create a special matrix object
myMatrix <- makeCacheMatrix(matrix(1:4, nrow = 2))

# Compute the inverse (which should not be cached yet)
cachesolve(myMatrix)

# Compute the inverse again (which should be retrieved from cache)
cachesolve(myMatrix)

# Change the matrix
myMatrix$setMatrix(matrix(c(3, 2, 2, 1), nrow = 2))

# Compute the inverse again (which should be recalculated)
cachesolve(myMatrix)
