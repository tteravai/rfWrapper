update_formula <- function(old, new, ...) {
  tmp <- .Call(stats:::C_updateform, as.formula(old), as.formula(new)); 
  out <- formula(terms.formula(tmp, simplify = TRUE, ...));
  return(out)
}

randomForest <- function(form, data_in, ...) {
  ## this will ignore any functions in the formula, even ones wrapped in I().
  ## just use variables.
  form <- as.formula(form) ## rely on & pass error if not form cannot be coerced to formula.
  if (!attr(terms(form, data = data_in), "response")) stop("Formula has no response variable (lhs).")
  class_y <- class(data_in %>% pull(all.vars(form)[1]))
  print(paste("Response variable type: ", paste(class_y, collapse = ", "), sep = ""))
  if ("character" %in% class_y) {
    print("Coercing character to factor.")
    form <- update_formula(form, as.factor(.) ~ ., data = data_in)
  }
  randomForest:::randomForest.formula(form, data_in, ...)
}
