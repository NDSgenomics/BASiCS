context("Differential test\n")

test_that("Differential test is correct", 
{
  data(ChainSC)
  data(ChainRNA)
            
  Test <- BASiCS_TestDE(Chain1 = ChainSC, Chain2 = ChainRNA,
                        GroupLabel1 = 'SC', GroupLabel2 = 'P&S',
                        EpsilonM = log2(1.5), EpsilonD = log2(1.5), 
                        OffSet = TRUE, Plot = FALSE, PlotOffset = FALSE)
            
  # Classification frequency
            
  FreqMean0 <- c(335,  8,   7)
  FreqMean <- as.vector(table(Test$TableMean$ResultDiffMean))
  expect_true(all.equal(FreqMean, FreqMean0))
            
  FreqDisp0 <- c(15, 295,   1,  39)
  FreqDisp <- as.vector(table(Test$TableDisp$ResultDiffDisp))
  expect_true(all.equal(FreqDisp, FreqDisp0))
            
  # Posterior probabilities
            
  ProbMean0 <- c(0.00, 0.01, 0.77, 0.43, 0.19)
  ProbMean <- round(Test$TableMean$ProbDiffMean[1:5], 2)
  expect_true(all.equal(ProbMean, ProbMean0))
            
  ProbDisp0 <- c(0.69, 0.60, 0.60, 1.00, 0.40)
  ProbDisp <- round(tail(Test$TableDisp$ProbDiffDisp, 5), 2)
  expect_true(all.equal(ProbDisp, ProbDisp0))
            
  # Log2 fold changes
            
  Lfc2Mean0 <- c(-0.17, -0.02, -0.78, -0.51, -0.32)
  Lfc2Mean <- round(Test$TableMean$MeanLog2FC[1:5], 2)
  expect_true(all.equal(Lfc2Mean, Lfc2Mean0))
            
  Lfc2Disp0 <- c(0.62,  0.67,  0.54, 4.39, -0.12)
  Lfc2Disp <- round(tail(Test$TableDisp$DispLog2FC, 5),2)
  expect_true(all.equal(Lfc2Disp, Lfc2Disp0))
            
})




