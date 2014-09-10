## Two functions will work to cache the result of matrix inversion to improve
## process efficiency. 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    if (is.matrix(x) != T){
        message("invalid input")
    }
    else{
        cx <<- x
        cinvx <<- solve(x)
    }
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix. If the inverse has already been calculated (and the matrix
## has not changed), then cacheSolve will retrieve the inverse from the
## cache

cacheSolve <- function(x, ...) {
    if (is.matrix(x) != T){
        print("invalid input")
    }
    else if (identical(x,cx) & class(cinvx)== "matrix"){
        message("cache exists")
        return(cinvx)
    }
    else{
        message("cache does not exists")
        return(solve(x))
    }
}