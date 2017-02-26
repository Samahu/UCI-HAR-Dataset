---
title: "Geting and Cleaning Data - Project"
author: "Ussama Naal"
date: "February 25, 2017"
output:
  html_document: default
  pdf_document: default
---

## Description

This repository contains all required data and scripts to fullfil the assignment plus the complete tidy data.  
Files:  
* README.md: this file.  
* tidy_data.R: is the code book "R Script"" that transforms and tidy the data then generate results.  
* measurements-tidy.csv: the completed tidy data of measurmentes. the file contains the following variables:  
  + tBodyAcc.mean.X  
  + tBodyAcc.mean.Y  
  + tBodyAcc.mean.Z  
  + tBodyAcc.std.X  
  + tBodyAcc.std.Y  
  + tBodyAcc.std.Z  
  + Subject  
  + Activity  
* averages-tidy.csv: averages of measurements after being grouped by Activity and Subject. the file contains the following variables:  
  + Activity  
  + Subject  
  + mean(tBodyAcc.mean.X)  
  + mean(tBodyAcc.mean.Y)  
  + mean(tBodyAcc.mean.Z)  
  + mean(tBodyAcc.std.X)  
  + mean(tBodyAcc.std.Y)  
  + mean(tBodyAcc.std.Z)  

To generate the results yourself you would need to:  
1. Clone the repository to some local folder on your computer.  
2. From R\RStudio environment make the folder the current active directory by executing the "setwd" command.  
3. Execute the R script "tidy_data.R"  

For the exact steps on how the results are generated please review the code and the comments in "tidy_data.R"  