clear all
close all
addpath('../matlab_utils')

con_rule = false; %wether the control rule should be applied
poly3 = false; %wether to use 3rd poly
y4 = false; %wether to use 4 models

loadData
modelFitting
plotData
