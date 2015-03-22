## Put comments here that give an overall description of what your
## functions do

## This source file contains two functions that create's an object (makeCacheMatrix) 
## that allows caching of a matrix. Tha make function has getter and setter functions
## The solve fucntion is called to evaluate the matrix inverse. If the inverse matrix 
## already exits then this "cached" version is used. 

## Write a short comment describing this function
#setwd("~/GitHub/ploncker/ProgrammingAssignment2")

## to use this function an example is given below
## create a matrix x<-matrix(c(1,2,2,1), nrow=2, ncol=2)
## pass to makeCacheMatrix, and assign a new variable y<-makeCacheMatrix(x)
## then solve y ie, z<-cacheSolve(y)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(solve) m <<- solve
  getSolve <- function() m
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}

