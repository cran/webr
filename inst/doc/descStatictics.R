## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment = NA,message=FALSE,warning=FALSE,fig.width=6,fig.height = 6, fig.align='center',out.width="70%")

## ----eval=FALSE---------------------------------------------------------------
#  if(!require(devtools)) install.packages("devtools")
#  devtools::install_github("cardiomoon/webr")
#  devtools::install_github("cardiomoon/moonBook")   # For examples
#  devtools::install_github("cardiomoon/rrtable")    # For reproducible research

## ----message=FALSE------------------------------------------------------------
require(webr)
require(moonBook) # For data acs

## -----------------------------------------------------------------------------
freqSummary(acs$Dx)
freqTable(acs$Dx)

## -----------------------------------------------------------------------------
result=freqTable(acs$Dx)
class(result)

## -----------------------------------------------------------------------------
freqTable(mtcars$mpg)

## -----------------------------------------------------------------------------
x2Table(acs,Dx,sex)

## -----------------------------------------------------------------------------
x2Table(acs,Dx,sex,margin=2)

## -----------------------------------------------------------------------------
x2Table(acs,Dx,sex,show.percent=FALSE)

## ----message=FALSE------------------------------------------------------------
require(dplyr)
numSummary(acs$age)
numSummaryTable(acs$age)

## -----------------------------------------------------------------------------
numSummary(acs)
numSummaryTable(acs)

## -----------------------------------------------------------------------------
acs %>% select(age,EF) %>% numSummary
acs %>% select(age,EF) %>% numSummaryTable

## -----------------------------------------------------------------------------
acs %>% group_by(sex) %>% select(age,EF) %>% numSummary
acs %>% group_by(sex) %>% select(age,EF) %>% numSummaryTable

## -----------------------------------------------------------------------------
acs %>% group_by(sex,Dx) %>% select(age,EF) %>% numSummary
acs %>% group_by(sex,Dx) %>% select(age,EF) %>% numSummaryTable

## -----------------------------------------------------------------------------
require(rrtable)
type=c("table","table")
title=c("Frequency Table","Numerical Summary")
code=c("freqTable(acs$Dx)","acs %>% group_by(sex) %>% select(EF,age) %>% numSummaryTable")
data=data.frame(type,title,code,stringsAsFactors = FALSE)
data2pptx(data)
data2docx(data)


