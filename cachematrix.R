## Two functions used to calulate the inverse of a matrix and cache it.
## If the inverse of the matrix has already been calculated, then pull in cached value
## 	rather than recomputing it.

## Code completed as part of Coursera class "R Programming" May 2015


## makeCacheMatrix is a function that creates a list with 4 functions to set and get 
## values of the matrix, and to set and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
			x <<- y
			inv <<- NULL
	        }
	get <- function() x
	setinv <- function(solve) inv <<- solve
	getinv <- function() inv
	list(set = set, get = get,
		setinv = setinv,
		getinv = getinv)

}


## Using the matrix created from the makeCacheMatrix function, check if inverse has already
##  been computed, if so get the cached version, if not use solve() to calculate the inverse

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
        	message("Retrieving cached inverse of the matrix")
        	return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}
