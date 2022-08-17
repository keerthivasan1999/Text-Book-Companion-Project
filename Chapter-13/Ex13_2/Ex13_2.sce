//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                            //To clear the console screen
clear;                          //To clear all the existing variables in the memory
exec('.\ManningEquation1.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency ManningEquation1.sci file is saved.


//Given data
b=0.8                           //b is bottom width of the channel in 'm'
theta=60                        //theta is trapezoid angle in '°(degree)'
alpha_1=0.3                     //alpha_1 is bottom slope 1 of the channel in '°(degree)'
alpha_2=1                       //alpha_2 is bottom slope 2 of the channel in '°(degree)'
y=0.52                          //y is flow depth in 'm'


//Unit conversion
theta=theta*%pi/180             //Convesion from '°(degree)' to 'radian'
alpha_1=alpha_1*%pi/180         //Convesion from '°(degree)' to 'radian'
alpha_2=alpha_2*%pi/180         //Convesion from '°(degree)' to 'radian'


//Assumption
n=0.030                         //n is dimension less Manning coefficient
a=1                             //a is a factor with uint 'm^(1/3)/s'


//Calculation
A_c=y*(b+(y/tan(theta)))        //A_c is cross sectional area of the channel in 'm2
p=b+((2*y)/(sin(theta)))        //p is perimeter of the channel in 'm'
R_h=A_c/p                       //R_h is radius of the channel in 'm'
S0_1=tan(alpha_1)               //S0_1 is the bottom slope 1
S0_2=tan(alpha_2)               //S0_2 is the bottom slope 2
V_dot_1=ManningEquation1(alpha_1)//V_dot_1 is volume flow rate in 'm3/s' measured at bottom slope S0_1
V_dot_2=ManningEquation1(alpha_2)//V_dot_2 is volume flow rate in 'm3/s' measured at bottom slope S0_2


//Display of result
mprintf('\nVolume flow rate at bottom slope of %.1f° is %.2f m3/s.\nVolume flow rate at bottom slope of %d° is %.1f m3/s.',alpha_1*180/%pi,V_dot_1,alpha_2*180/%pi,V_dot_2)

