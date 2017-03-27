Shiny App Presentation
========================================================
author: Charles McKay
date: March 29, 2017
autosize: true

## App High-Level Description
========================================================


- The app predicts a car's 1/4 mile time in seconds
- A linear mode based on  the "mtcars" dataset generates the prediction
- User inputs are: car weight and horse power
- The "mtcars" dataset and the "new Car" are disleyaed in a Plotly plot


## 1/4 Mile Time Prediction Model
========================================================


```r
data(mtcars)
mtfit <- lm(qsec ~ wt + hp, data = mtcars)
summary(mtfit)
```

```

Call:
lm(formula = qsec ~ wt + hp, data = mtcars)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.8283 -0.4055 -0.1464  0.3519  3.7030 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 18.825585   0.671867  28.020  < 2e-16 ***
wt           0.941532   0.265897   3.541  0.00137 ** 
hp          -0.027310   0.003795  -7.197 6.36e-08 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.09 on 29 degrees of freedom
Multiple R-squared:  0.652,	Adjusted R-squared:  0.628 
F-statistic: 27.17 on 2 and 29 DF,  p-value: 2.251e-07
```

## Plotly Plot of mtcars and an example "New Car"
========================================================



```
Error in loadNamespace(name) : there is no package called 'webshot'
```
