load_all()
load_all("/exports/igmm/eddie/cvallejo-scRNAseq/alan/Scalability")

d <- zd()

bn <- BASiCS_MCMC(d, N = 20000, Thin = 10, Burn = 10000, PrintProgress = FALSE,
    Regression = TRUE, WithSpikes = TRUE, DM_new = TRUE)
bo <- BASiCS_MCMC(d, N = 20000, Thin = 10, Burn = 10000, PrintProgress = FALSE, 
    Regression = TRUE, WithSpikes = TRUE, DM_new = FALSE)


BASiCS_showFit(bn)
BASiCS_showFit(bo)
