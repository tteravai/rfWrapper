# rfWrapper

It irritated me that randomForest() couldn't automatically handle character responses, so this changes the formula to add `as.factor` to the LHS. Rough.

## Bugs

Probably a lot for 20 lines. 

Most notably, don't count on it working if you use function calls in the formula, which you probably shouldn't do anyway.

Also this smashes the global namespace (I'll make it a package some day lol), particularly breaking the use of the `randomForest(x, y, xtest, ytest, ...)` convention. If you use it you're stuck with formulas until you `rm(randomForest, envir = .GlobalEnv)`.
