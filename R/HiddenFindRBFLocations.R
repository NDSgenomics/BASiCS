HiddenFindRBFLocations <- function(Data, k = 12) {
  as.vector(estimateRBFLocations(log(Data), k))
}
