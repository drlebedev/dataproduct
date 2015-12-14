---
title       : Tomales Bay water temp model
subtitle    : Data product class
author      : Kirill Lebedev
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- &twocol

## Overview

*** {name: left}

Provided model is a linear model that allows to predict water tempreture
in Tomales Bay (Point Reyes, CA) based on wind, air temp and pressure.

Tomales Bay is one of the warmest place in San Francisco Bay Area. 
Provided model tries to predict water tempreture. This information could be really valuable for a good weekend escape ;)

*** {name: right}

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

--- 

## Data Source

All the data for this model provided by the University of California, Davis, Bodega Marine Laboratory and a property of Laboratory. Data are subject of copyrigth.
                          
Source data can be found on: http://bml.ucdavis.edu/boon/data_access.html

Model is built on hourly 2013 data of water tempreture, average wind air tempreture and barometric pressure. 
                             
* All tempreture is in Celsium. 
* Wind is in mph. 
* Barometric pressure is in millibars.

---

## Model

Lets take a look into full model summary:


```
## 
## Call:
## lm(formula = water_temp ~ wind + air_temp + pressure, data = data)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -9.6894 -0.8223 -0.0957  0.7894  6.8401 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 60.325754   3.053761   19.75   <2e-16 ***
## wind        -0.054971   0.002193  -25.07   <2e-16 ***
## air_temp     0.203887   0.005002   40.76   <2e-16 ***
## pressure    -0.049879   0.002984  -16.71   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.274 on 8691 degrees of freedom
##   (3 observations deleted due to missingness)
## Multiple R-squared:  0.268,	Adjusted R-squared:  0.2677 
## F-statistic:  1060 on 3 and 8691 DF,  p-value: < 2.2e-16
```

---

## Prediction 

Interactive model is available on:

## https://drlebedev.shinyapps.io/tomalesbay


Feel free to use it for your weekend trip if you are in Bay Area.

