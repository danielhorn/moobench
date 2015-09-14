#' DTLZ7 test function generator.

generateDTLZ7 = function(in.dim = 30L, out.dim = 2L) {
  
  param.set = makeParamSet(
    makeNumericVectorParam(id = "x", len = in.dim, lower = 0, upper = 1),
    forbidden = expression({
      #FIXME: Ask someone intelligent!! This is not good!!!
      if (is.list(x))
        x = x[[1L]]
      f = dtlz7(x, out.dim)
      
      gj = all(sapply(1:(out.dim - 1), function(j) f[out.dim] + 4 * f[j] - 1) >= 0)
      
      combos = combn(1:(out.dim - 1), 2)
      fmin = sapply(1:ncol(combos), function(i) f[combos[1, i]] + f[combos[2, i]])
      gm = 2 * f[out.dim] + min(fmin) - 1 >= 0
      
      gj && gm
    }))
  
  paretoSet = NULL
  
  mooFunction(
    name = "dtlz7",
    id = sprintf("dtlz7-%id-%id", in.dim, out.dim),
    fun = dtlz7,
    in.dim = in.dim,
    out.dim = out.dim,
    param.set = param.set,
    paretoSet = paretoSet)
}

# Definiton of dtlz7
dtlz7 = function(x, out.dim) {
  n_M = length(x) / out.dim
  
  sapply(1:out.dim, function(j) 1 / floor(n_M) * sum(x[floor((j - 1) * n_M):floor(j * n_M)]))
}