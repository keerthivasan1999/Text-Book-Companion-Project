clc             //To clear the console screen
clear           //To clear all the existing variables in the memory


//Given data
m=1             //m is mass in 'lbm'


//Assumption
g=32.174        //g is acceleration due to gravity in 'ft/s2'


//Calculation
W=m*g           //W is weight in '(lbm ft)/s2'
W=W/g           //Conversion from '(lbm ft)/s2' to 'lbf'


//Display of result
printf("Weight is %.2f lbf.",W)
