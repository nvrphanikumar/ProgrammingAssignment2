## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  getinput <- function() x
  setinput <- function(y) { 
       x <<- y 
       m <<- NULL 
     } 
  
  setinv <- function(solve) m <<- solve
  getinv <- function() m
 list(getinput = getinput ,setinput = setinput ,setinv = setinv, getinv = getinv)
}
##Phani

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getinput()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
