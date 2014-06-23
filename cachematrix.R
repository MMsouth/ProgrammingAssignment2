## Two functions to invert and store the inverse a matrix for later retreival to save
## computing time.

## The following function can create a "matrix" object and store its 
## inverse for future use.

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
                x <<- y
                inverse <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inverse <<- solve
        getinverse <- function() inverse
        list(set = set, get = get,
             getinverse = getinverse,
             setinverse = setinverse)
}


## The following function can either invert the matrix created by the 
## "makeCacheMatrix" function above or load the inverse already stored.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
                message("getting cached inverse")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data)
        x$setinverse(inverse)
        inverse
}

## The following is to test the functions created.
## t <- makeCacheMatrix()
## t$set(matrix(c(1, 3, 5, 7), 2, 2))
## t$get()
## cacheSolve(t)
 
