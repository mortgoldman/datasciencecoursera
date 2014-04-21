## Coursera R Peer Assignment
## Mort Goldman
##
## memoize inverse matrix in an approach very reminiscent of SICP.

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)  # note no error handling (as per spec) ... let's hope this matrix is invertible!
  x$setInverse(m)
  m
}

## test:
# hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
# h8 <- hilbert(8); h8
# sh8 <- solve(h8)
# sh8
# ah8<-makeCacheMatrix(h8)
# cacheSolve(ah8)  -- note run this twice -- first time calcs and second time retireves memoized copy
