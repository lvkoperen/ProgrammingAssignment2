## The following two functions are used to cache the inverse of a matrix

## The following function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list (set=set, 
	      get=get,
	      setinverse=setinverse,
	      getinverse=getinverse)
}


## The following function computes the inverse of the special "matrix" that is returned by the function makeCacheMatrix that I made above. If the inverse has already been calculated (and the matrix has nog changed), then the cachesolve should retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)){
        	message("getting cached data")
        	return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
