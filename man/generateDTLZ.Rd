% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/dtlz.R
\name{generateDTLZ}
\alias{DTLZ}
\alias{dtlz}
\alias{generateDTLZ}
\title{DTLZ test function generator.}
\usage{
generateDTLZ(id, in.dim = 30L, out.dim = 2L)
}
\arguments{
\item{id}{[\code{integer(1)}] \cr
Which DTLZ function? Valid values are 1, 2, ..., 7}

\item{in.dim}{[\code{integer(1)}] \cr
Size of parameter space.}

\item{out.dim}{[\code{integer(1)}] \cr
Size of target space.}
}
\value{
A \code{mooFunction}.
}
\description{
DTLZ test function generator.
}
\examples{
x = runif(30)
 fun = generateDTLZ(id = 1, in.dim = 30L, out.dim = 2L)
 fun(x)
}
\references{
Deb, Kalyanmoy ; Thiele, Lothar ; Laumanns, Marco ; Zitzler, Eckart:
Scalable multi-objective optimization test problems /
Computer Engineering and Networks Laboratory (TIK),
Swiss Federal Institute of Technology (ETH). 2002.
}

