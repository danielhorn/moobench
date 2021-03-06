#' WFG test function generator.
#' 
#' @param id [\code{integer(1)}] \cr
#'   Which WFG function? Valid values are 1, 2, ..., 9
#' @param in.dim [\code{integer(1)}] \cr
#'   Size of parameter space.
#' @param out.dim [\code{integer(1)}] \cr
#'   Size of target space.
#' @param k [\code{integer(1)}] \cr
#'   Number position-related parameters.
#' @return A \code{mooFunction}.
#' 
#' @references 
#' Huband, Simon ; Hingston, Phil ; Barone, Luigi ; While, Lyndon:
#' A Review of Multiobjective Test Problems and a Scalable Test Problem
#' Toolkit. In: IEEE Trans. on Evolutionary Computation 10 (2006), 
#' No. 5, pp. 477-506
#' 
#' @aliases wfg WFG
#' 
#' @export

generateWFG = function(id, in.dim, out.dim, k) {
  in.dim = asCount(in.dim)
  out.dim = asCount(out.dim)
  k = asCount(k)
  
  if(!(k %in% 1:(in.dim - 1)))
    stop("k must be between 1 and (in.dim - 1). Your k violates this constraint.")
  if(k %% (out.dim - 1) != 0) 
    stop("k must be divisble by (out.dim - 1). Your k violates this constraint.")  
  if (out.dim < 2L)
    stopf("You set your out.dim to %i. This is not multicrit! Set it at least to 2.", out.dim)
  
  if (in.dim < out.dim)
    stopf("You set out.dim = %i and in.dim = %i, but in.dim must be greater than out.dim!.",
      out.dim, in.dim)
  
  if(id %in% c(2, 3) && (in.dim - k) %% 2 != 0L)
    stopf("Number of distance-related parameters must be divisible by 2 for WFG%i. But it is not in your case", id)
    
  
  assertChoice(id, 1:9)
  
  param.set = makeNumericParamSet(id = "x", len = in.dim, lower = 0, upper = 1)
  
  switch(id,
    generateWFG1(in.dim, out.dim, k), 
    generateWFG2(in.dim, out.dim, k), 
    generateWFG3(in.dim, out.dim, k), 
    generateWFG4(in.dim, out.dim, k), 
    generateWFG5(in.dim, out.dim, k), 
    generateWFG6(in.dim, out.dim, k), 
    generateWFG7(in.dim, out.dim, k), 
    generateWFG8(in.dim, out.dim, k), 
    generateWFG9(in.dim, out.dim, k)
  )
  
}
