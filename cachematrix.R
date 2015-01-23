## makeCacheMatrix creates a matrix object that can be called by 
## cacheSolve using x$invertMatrix (which inverts the matrix) or
## x$getMatrix (which returns the matrix).

makeCacheMatrix <- function(x = matrix()) {
    
    ## m contains the inverted matrix
    ## m returns NULL when getMatrix is called if no inverted matrix 
    ## has been created yet
    m <- NULL
    
    ## setMatrix assigns a matrix to x
    ## This is necessary because when the matrix (x) changes,
    ## its inverse (m) has to be recalculated.
    setMatrix <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    ## invertMatrix saves the inverted matrix into variable m 
    ## (note: this makes the if-statement in cacheSolve true)
    ## Also, m is accessible as it is outside  makeCacheMatrix
    ## because of <<- operator
    invertMatrix <- function(y) m <<- solve(y)
    
    ## getMatrix returns the matrix, or NULL if it hasn't been inverted
    ## yet
    getMatrix <- function() x
}


## cacheSolve takes makeCacheMatrix as argument. 
## It checks if an inverted matrix already exists. If so, it returns
## that cached matrix. If not, it creates it (all using makeCacheMatrix)

cacheSolve <- function(x, ...) {
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
