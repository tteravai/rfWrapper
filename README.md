# rfWrapper

It irritated me that randomForest() couldn't automatically handle character responses, so this changes the formula to add `as.factor` to the LHS. Rough.

## Bugs

Probably a lot for 20 lines. 

Most notably, don't count on it working if you use function calls in the formula, which you probably shouldn't do anyway.
