milk.data <- read.table("T5-13.dat")
head(milk.data)
colnames(milk.data)<- c("Fuel", "Repair", "Capital")
summary(milk.data)

# Constructing QQ Plots of the marginal distributions of Fuel, Repair and Capital Costs

par(mfrow=c(2,3))
qqnorm(milk.data$Fuel, main = "Normal QQ Plot of Fuel") # Two points in the QQ Plot of Fuel look like outliers
qqnorm(milk.data$Repair, main = "Normal QQ Plot of Repair")
qqnorm(milk.data$Capital, main = "Normal QQ Plot of Capital")

# Constructing scatterplots of pairs of different variables

plot(x=milk.data$Fuel, y=milk.data$Repair, main = "Fuel v/s Repair")
plot(x=milk.data$Repair, y=milk.data$Capital, main = "Repair v/s Capital")
plot(x=milk.data$Fuel, y=milk.data$Capital, main = "Fuel v/s Capital")

# Detecting two outliers in Fuel

n <- length(milk.data$Fuel)
outlier1 <- which(milk.data$Fuel == sort(milk.data$Fuel)[n])
outlier2 <- which(milk.data$Fuel == sort(milk.data$Fuel)[n-1])

# Data without outliers
milk.data.without.outliers <- milk.data[-c(outlier1, outlier2),]

# Constructing QQ Plots of the marginal distributions of Fuel, Repair and Capital Costs WITHOUT OUTLIERS

qqnorm(milk.data.without.outliers$Fuel, main = "Normal QQ Plot of Fuel without outliers")
qqnorm(milk.data.without.outliers$Repair, main = "Normal QQ Plot of Repair without outliers")
qqnorm(milk.data.without.outliers$Capital, main = "Normal QQ Plot of Capital without outliers")

# Constructing scatterplots of pairs of different variables WITHOUT OUTLIERS

plot(x=milk.data.without.outliers$Fuel, y=milk.data.without.outliers$Repair, main = "Fuel v/s Repair")
plot(x=milk.data.without.outliers$Repair, y=milk.data.without.outliers$Capital, main = "Repair v/s Capital")
plot(x=milk.data.without.outliers$Fuel, y=milk.data.without.outliers$Capital, main = "Fuel v/s Capital")

#------------------- 95% Bonferroni Intervals for individual means of complete data ----------------------

alpha <- 0.05
p<- ncol(milk.data)
n<- nrow(milk.data)

# Covariance matrix and Inverse of covariance matrix
S <- cov(milk.data)
S_inv <- solve(S)

# Mean of columns
x.bar <- c()
for(i in 1:p)
{
  x.bar[i] <- mean(milk.data[,i])
}

# Standard error for Bonferroni C.I
se <- c()
for ( i in 1: p)
{
  se[i] <- abs(qt(alpha/(2*p), n-1)*sqrt(S[i,i]/n))
}

# Bonferroni Intervals for p columns

Bon.CI <- matrix(NA, nrow = p, ncol = 2)
for (i in 1:p)
{
  Bon.CI[i,]<- c(x.bar[i] - se[i], x.bar[i] + se[i])
}

Bon.CI

#-----------------95% Bonferroni Intervals for individual means of data without outliers -----

alpha <- 0.05
p<- ncol(milk.data.without.outliers)
n<- nrow(milk.data.without.outliers) #note that n will be different since outliers are removed

# Covariance matrix and Inverse of covariance matrix
S <- cov(milk.data.without.outliers)
S_inv <- solve(S)

# Mean of columns
x.bar <- c()
for(i in 1:p)
{
  x.bar[i] <- mean(milk.data.without.outliers[,i])
}

# Standard error for Bonferroni C.I
se <- c()
for ( i in 1: p)
{
  se[i] <- abs(qt(alpha/(2*p), n-1)*sqrt(S[i,i]/n))
}

# Bonferroni Intervals for p columns

Bon.CI.without.outliers <- matrix(NA, nrow = p, ncol = 2)
for (i in 1:p)
{
  Bon.CI.without.outliers[i,]<- c(x.bar[i] - se[i], x.bar[i] + se[i])
}

Bon.CI.without.outliers

#------------- 95% Simultaneous Intervals for entire data--------------------------------------------------

alpha <- 0.05
p<- ncol(milk.data)
n<- nrow(milk.data)

# Covariance matrix and Inverse of covariance matrix
S <- cov(milk.data)
S_inv <- solve(S)

# Mean of columns
x.bar <- c()
for(i in 1:p)
{
  x.bar[i] <- mean(milk.data[,i])
}

# Standard error for Simultaneous C.I
se <- c()
for (i in 1: p)
{
  se[i] <- sqrt((p*(n-1)/(n-p))*qf(0.95, p, n-p)*(S[i,i]/n))
}

# Simultaneous Intervals for p columns

Sim.CI <- matrix(NA, nrow = p, ncol = 2)
for (i in 1:p)
{
  Sim.CI[i,]<- c(x.bar[i] - se[i], x.bar[i] + se[i])
}

Sim.CI

#------------- 95% Simultaneous Intervals for data without outliers------------------------------------

alpha <- 0.05
p<- ncol(milk.data.without.outliers)
n<- nrow(milk.data.without.outliers) #note that n will be different since outliers are removed

# Covariance matrix and Inverse of covariance matrix
S <- cov(milk.data.without.outliers)
S_inv <- solve(S)

# Mean of columns
x.bar <- c()
for(i in 1:p)
{
  x.bar[i] <- mean(milk.data.without.outliers[,i])
}

# Standard error for Simultaneous C.I
se <- c()
for (i in 1: p)
{
  se[i] <- sqrt((p*(n-1)/(n-p))*qf(0.95, p, n-p)*(S[i,i]/n))
}

# Simultaneous Intervals for p columns

Sim.CI.without.outliers <- matrix(NA, nrow = p, ncol = 2)
for (i in 1:p)
{
  Sim.CI.without.outliers[i,]<- c(x.bar[i] - se[i], x.bar[i] + se[i])
}

Sim.CI.without.outliers


Bon.CI
Bon.CI.without.outliers
Sim.CI
Sim.CI.without.outliers
