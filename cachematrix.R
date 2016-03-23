## Put comments here that give an overall description of what your
## functions do

## Similar to example function this fuction accepts a matrix value
## and caches it. It can be subset with four embedded functions:
## 1) set replaces the previous matrix value with a new given matrix
## 2) get retrieves current matrix value
## 3) setinverse is used by cacheSolve to evaluate inverse of current matrix
## 4) getinverse is used by cacheSolve to determine if inverse is calculated yet

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set = set, get = get, 
		setinverse = setinverse, 
		getinverse = getinverse)
}


## Also similar to example, this function accepts the function makeCacheMatrix
## and calculates the inverse of the cached matrix. Or if the inverse is
## alread calculated, then the calculation is skipped and inverse given.

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
			
      } else {
      	data <- x$get()
      	inv <- solve(data, ...)
      	x$setinverse(inv)
      	inv
	}
      ## Return a matrix that is the inverse of 'x'
}
