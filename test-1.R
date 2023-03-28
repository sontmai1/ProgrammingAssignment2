source("cachematrix.R")

# Create special matrix object
myMatrix <- makeCacheMatrix(matrix(1:4, nrow = 2))

# Get the matrix
myMatrix$getMatrix()

# Calculate the inverse
myMatrix$calculateInverse()

# Get cached inverse
myMatrix$getInverse()

# Set the matrix to a new value
myMatrix$setMatrix(matrix(c(3, 2, 2, 1), nrow = 2))

# Get the new matrix
myMatrix$getMatrix()

