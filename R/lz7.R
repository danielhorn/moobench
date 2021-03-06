# LZ7 test function generator.

generateLZ7 = function(in.dim = 30L, out.dim = 2L) {
  
  param.set = makeNumericParamSet(id = "x", len = in.dim, lower = 0, upper = 1)
  
  paretoSet = function(n = out.dim * 100L) {
    des = generateDesign(par.set = param.set, n = n)
    des = des[order(des[, 1L]), ]
    rownames(des) = 1:nrow(des)
    
    x1 = des[, 1L]
    j = 2:in.dim
    
    des[, -1L] = t(sapply(x1, function(x) x^(0.5 * (1 + (3 * (j - 2)) / (in.dim - 2)))))

    des
  }
  
  paretoFront = function(n = out.dim * 100L) {
    f1 = runif(n)
    f2 = 1 - sqrt(f1)
    
    des = cbind(f1, f2)
    des = des[order(des[, 1L]), ]
    rownames(des) = 1:nrow(des)
    
    as.data.frame(des)
  }
  
  mooFunction(
    name = "lz7",
    id = sprintf("lz7-%id-%id", in.dim, out.dim),
    fun = lz7,
    in.dim = in.dim,
    out.dim = out.dim,
    param.set = param.set,
    paretoSet = paretoSet,
    paretoFront = paretoFront)
}

# Definiton of lz7
lz7 = function(x) {
  j = 2:length(x)
  j1 = j[j %% 2 == 1L]
  j2 = j[j %% 2 == 0L]
  
  y = function(j) {
    x[j] - x[1L]^(0.5 * (1 + (3 * (j - 2)) / (length(x) - 2)))
  }
  
  f1 = x[1L] + 2 / length(j1) *  sum(y(j1)^2 - cos(8 * y(j1) * pi) + 1)
  f2 = 1 - sqrt(x[1L]) + 2 / length(j2) * sum(4 * y(j2)^2 - cos(8 * y(j2) * pi) + 1)
  return(c(f1, f2))
}
