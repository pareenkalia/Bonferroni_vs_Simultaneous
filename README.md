# Bonferroni_vs_Simultaneous
Construction of Bonferroni and Simultaneous Intervals

The data is obtained from http://esminfo.prenhall.com/math/johnsonwichern/data.html , name of the file is T5-13.dat

The data has 25 rows and 3 variables, Fuel, Repair and Capital. 
The aim is to construct intervals for the mean vector of these variables. 

First, I construct the QQ plots of the 3 variables and analyze if they look normal.
The QQ Plot of Fuel has 2 outliers. I remove those two outliers and construct QQ plots again. These look more normally distributed but don't show a big difference.
I construct scatterplots of pairs of variables. The plots look well scattered with no clear pattern thus showing that the variables look fairly independent. 

Next, I construct the Bonferroni Intervals of the entire dataset and the same of the dataset without outliers. As expected, the intervals for the data without the outliers is much narrower.
Then I consruct the Simultaneous T2 intervals of the entire data set and the dataset without outliers. 

Simultaneous intervals are wider than the Bonferrno intervals as one would expect. Bonferroni Intervals without outliers give us the narrowest intervals.

