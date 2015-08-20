#' GOMOP functions
#' 
#' GOMOP functions are multicrit test functions that are composed of multiple
#' single crit test functions. Here we allow only soobench functions as single
#' crit functions. Note that all input parameter for the GOMOP function have the
#' bounds (0, 1) and are stretched to the bounds of the respective soobench functions.
#' 
#' @param in.dim [\code{integer(1)}] \cr
#'   Size of parameter space. Every soobench-function must have this in.dim
#' @param out.dim [\code{integer(1)}] \cr
#'   Size of target space. Is automatically set to length of soobench.funs.
#' @param soobench.funs[\code{list}] \cr
#'   List of \code{\link[soobench]{soo_function}}.
#' @return A \code{mooFunction}.
#' 
#' @references Reference Einfuegen
#' 
#' @export
#' 
generateGOMOP = function(in.dim = 30L, out.dim, soobench.funs = list()) {
  in.dim = asCount(in.dim)
  if (!missing(out.dim) && out.dim != length(soobench.funs))
    warn("Overwriting the specified out.dim by length of soobench.funs.")
  out.dim = length(soobench.funs)
  
  # Check all soobench.funs have in.dim in.dim
  lapply(soobench.funs, function(f)
    if (number_of_parameters(f) != in.dim)
      stopf("You specified in.dim %d, but one of your function has in.dim %d.",
        in.dim, number_of_parameters(f))
    )
  
  lower.bounds = rep(0, in.dim)
  upper.bounds = rep(1, in.dim)
  
  do.gomop.eval = function(x, out.dim)
    sapply(soobench.funs, function(f) f(x * (upper_bounds(f) - lower_bounds(f)) + lower_bounds(f)))
  
  mooFunction(
    name = "GOMOP",
    id = collapse(sapply(soobench.funs, function_id), sep = "_"),
    fun = function(x)
      evalMooFunction(do.gomop.eval, x, in.dim, out.dim, lower.bounds, upper.bounds),
    in.dim = in.dim,
    out.dim = out.dim,
    lower.bounds = lower.bounds,
    upper.bounds = upper.bounds,
    pareto.set = NULL,
    pareto.front = NULL)
}