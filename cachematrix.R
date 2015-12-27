## Put comments here that give an overall description of what your
## functions do
##makeCache creates a function that stores values while cacheSolve is used to check if a value 
# have already been calculated for a given matrix.

## Write a short comment describing this function
##makeCacheMatrix function creates an environment thats stores the functions.
#We will later subset the functions within it to retrieve stored results or Recalculate by making a
##new matrix definitions
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


## Write a short comment describing this function
# checks to see if a inverse of the given matrix is already available in cache.
#if it doesnt,its recalculated
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
