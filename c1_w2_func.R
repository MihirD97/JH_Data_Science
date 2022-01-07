## First Function in R!
add2 <- function(x, y) {
  x + y
}

add2(3,5)

#voila, as easy as that

#lets create a greater than  function that only returns values greater than some value

greater_than <- function (vec, limit = 10) {
  filter <- vec > limit
  vec[filter]
}

greater_than (vec = 1:20, limit = 4)

greater_than (vec = 1:20)                  # 10 taken as default value of 'limit' input parameter


# Lets create a function that returns means of all columns

means_col <- function(data, removeNA = TRUE){
  nc <- ncol(data)
  means <- numeric(nc)
  for (i in 1:nc){
    means[i] <- mean(data[,i], na.rm = removeNA)
  }
  means
}


means_col(airquality)                          # with removeNA default value
means_col(airquality, removeNA = FALSE)        # with manual removeNA value


# Lazy Evaluation
f <- function(a, b){
  a^2
}

f(2)

# No error cuz b is never used

f <- function(a, b){
  print(a)
  print(b)
}

f(45)

#error is thrown but only after print(a) is evaluated and print(b) cannot be.


# IMP Lexical Scoping
# Functions can return functions as return values
# Lets createa function that creates functions

make.power <- function (n){
  pow <- function(x){
    x^n
  }
  pow                                       # We return the function 'pow'. The variable 'n' is not defined within the scope of 'pow/ but in its parent environment of make.power
}                                           # Lets create a function

cube <- make.power(3)
square <- make.power(2)

cube (4)                                    # the argument '4' is passed to the 'pow' function which is assigned to 'cube. This '34 is passed as x to 'pow'. Notice 'n' is not defined directly
square (4)                                  # in 'pow'. However, in the parent environment of 'pow' we previously passed value of 'n' as 3 in the make.power() function.
                                            # R is able to pick the value of 'n' from the parent environment of 'pow' i.e the environment of 'make.power'. This is Lexical Scoping. Similar logic for square()

# How do you know what exists in a functions environment?
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))


# Lexical vs dynamic scoping
#Lets define certain functions -

y <- 10

f1 <- function(x){
  y <- 2
  y^2 + g1(x)
}

g1 <- function(x){
  x*y
}

# If we run f1(3), what is returned?

# When g1(x) is called, in Lexical scoping, value of y will be fetched from environment in which function g1(x) is defined, i.e the parent environment. So y = 10
# But in dynamic scoping, value of y will be taken from the environment from which the function g1(s) is called, i.e the environment of f1(s). So the value of y = 2