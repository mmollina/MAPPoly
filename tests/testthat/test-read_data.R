context("Read data")
test_that("read data from VCF file correctly", {
  fl = "https://github.com/mmollina/MAPpoly_vignettes/raw/master/data/BT/sweetpotato_chr1.vcf.gz"
  tempfl <- tempfile(pattern = 'chr1_', fileext = '.vcf.gz')
  download.file(fl, destfile = tempfl)
  dat.dose.vcf = read_vcf(file = tempfl, parent.1 = "PARENT1", parent.2 = "PARENT2")
  expect_equal(check_data_sanity(dat.dose.vcf), 0)
})
test_that("read data from dosage file correctly", {
  fl1 = "https://raw.githubusercontent.com/mmollina/MAPpoly_vignettes/master/data/SolCAP_dosage"
  tempfl <- tempfile()
  download.file(fl1, destfile = tempfl)
  SolCAP.dose <- read_geno(file.in  = tempfl)
  expect_equal(check_data_sanity(SolCAP.dose), 0)
})
test_that("read data from probability file correctly", {
  ft="https://raw.githubusercontent.com/mmollina/MAPpoly_vignettes/master/data/SolCAP"
  tempfl <- tempfile()
  download.file(ft, destfile = tempfl)
  SolCAP.dose.prob <- read_geno_prob(file.in  = tempfl)
  expect_equal(check_data_sanity(SolCAP.dose.prob), 0)
})
test_that("read data from CSV file correctly", {
  ft="https://raw.githubusercontent.com/mmollina/MAPpoly_vignettes/master/data/tetra_solcap.csv"
  tempfl <- tempfile()
  download.file(ft, destfile = tempfl)
  SolCAP.dose <- read_geno_csv(file.in  = tempfl, ploidy = 4)
  expect_equal(check_data_sanity(SolCAP.dose), 0)
})