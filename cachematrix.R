## makeCacheMatrix creates a matrix object that can be called by other
## functions using x$invertMatrix (which inverts the matrix) or
## x$getMatrix (which returns the matrix).

makeCacheMatrix <- function(x = matrix()) {
    ## m needs to be able to return if no inverted matrix has been
    ## created yet
    m <- NULL
    
    ## invertMatrix inverts a matrix (note: this changes  value of m
    ## from NULL to the matrix, making the if-statement in cacheSolve
    ## true)
    invertMatrix <- function(y) m <<- solve(y)

    ## getMatrix returns the matrix
    getMatrix <- function() x ## returns the matrix when called
}


## cacheSolve checks if an inverted matrix already exists. If so, it returns
## that cached matrix. If not, it creates it (all using makeCacheMatrix)

cacheSolve <- function(x, ...) { ## x stands for function makeCacheMatrix
    ## read output from function getMatrix from within makeCacheMatrix
    m <- x$getMatrix()
    
    ## if the inverted matrix exists, return it and exit
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    ## if the inverted matrix does not exist (i.e. m is NULL),
    ## call function invertMatrix from within makeCacheMatrix
    ## and return its output
    x$invertMatrix(m)
    m
}
