## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a matrix object that can be called by other
## functions using x$invertMatrix (which inverts the matrix) or
## x$getMatrix (which returns the matrix).

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    invertMatrix <- function(y) {
        x <<- solve(y) ## global variable contains the inverted matrix
    }
    getMatrix <- function() x ## returns the matrix when called
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getMatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    x$invertMatrix(m)
    m
}
