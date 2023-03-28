## The below functions support creating a special "matrix" object,
## which can cache its inverse value


# The makeCacheMatrix function creates a special “matrix” object, 
# which is really a list containing functions to
# 
# set the value of the matrix
# get the value of the matrix
# set the value of the cached inverse matrix
# get the value of the cached inverse matrix
# caculate (if not already) and set the value of the cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    
    # Initialize the cached inverse matrix
    cachedInverse <- NULL
    
    # Define the function to set the matrix
    setMatrix <- function(newValue) {
        x <<- newValue
        
        # clear value of cached Inverse
        cachedInverse <<- NULL
    }
    
    # Define the function to get the matrix
    getMatrix <- function() {
        x
    }
    
    # Define the function to set the cached inverse
    setInverse <- function(inverse) {
        cachedInverse <<- inverse
    }
    
    # Define the function to get the cached inverse
    getInverse <- function() {
        cachedInverse
    }
    
    # Define the function to calculate the inverse
    calculateInverse <- function() {
        # Get the matrix
        mat <- getMatrix()
        
        # Check if the inverse is already cached
        if (!is.null(cachedInverse)) {
            message("Returning existing cached inverse")
            return(cachedInverse)
        }
        
        # Calculate the inverse
        inverse <- solve(mat)
        
        # Cache the inverse
        setInverse(inverse)
        
        # Return the inverse
        inverse
    }
    
    # Return a list of functions
    list(setMatrix = setMatrix,
         getMatrix = getMatrix,
         setInverse = setInverse,
         getInverse = getInverse,
         calculateInverse = calculateInverse)
}


# The cachesolve function calculates the Inverse of the special “Matrix” 
# created with the above makeCacheMatrix function. 
# However, it first checks to see if the Inverse has already been calculated. 
# If so, it gets the Inverse from the cache and skips the computation. 
# Otherwise, it calculates the Inverse of the data and sets the value 
# of the Inverse in the cache via the setInverse function.

cachesolve <- function(x, ...) {
    
    # Get the cached inverse if it exists
    inverse <- x$getInverse()
    if (!is.null(inverse)) {
        message("Retrieving existing cached inverse")
        return(inverse)
    }
    
    # Calculate the inverse
    mat <- x$getMatrix()
    inverse <- solve(mat)
    
    # Cache the inverse
    x$setInverse(inverse)
    
    # Return the inverse
    inverse
}

