source("cachematrix.R")


# Create special matrix object
myMatrix <- makeCacheMatrix(matrix(1:4, nrow = 2))

# Compute the inverse (not be cached yet)
cachesolve(myMatrix)

# Compute the inverse again (retrieved from cache)
cachesolve(myMatrix)

# Change the matrix
myMatrix$setMatrix(matrix(c(3, 2, 2, 1), nrow = 2))

# Compute the inverse again (recalculated)
cachesolve(myMatrix)
