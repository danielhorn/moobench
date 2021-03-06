context("dtlz")

test_that("dtlz1", {
  f = generateDTLZ(1, in.dim = 2L, out.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(13, 0))
})

test_that("dtlz2", {
  f = generateDTLZ(2, in.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(0, 1.25))
})

test_that("dtlz3", {
  f = generateDTLZ(3, in.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(0, 26))
})

test_that("dtlz4", {
  f = generateDTLZ(4, in.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(0, 1.25))
})

test_that("dtlz5", {
  f = generateDTLZ(5, in.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(0, 2))
})

test_that("dtlz6", {
  f = generateDTLZ(6, in.dim = 2L)
  value = f(c(1, 1))
  expect_equal(value, c(1, 21))
})

# test_that("dtlz7", {
#   f = generateDTLZ(7, in.dim = 2L)
#   value = f(c(1, 1))
#   expect_equal(value, c(1, 21))
# })