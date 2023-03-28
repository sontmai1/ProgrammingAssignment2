## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    # Initialize the cached inverse matrix
    cachedInverse <- NULL
    
    # Define the function to set the matrix
    setMatrix <- function(newValue) {
        x <<- newValue
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
            message("Returning cached inverse")
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



## Write a short comment describing this function

# cacheSolve <- function(x, ...) {
#     ## Return a matrix that is the inverse of 'x'
# }

cachesolve <- function(x, ...) {
    
    # Get the cached inverse if it exists
    inverse <- x$getInverse()
    if (!is.null(inverse)) {
        message("Retrieving cached inverse")
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

