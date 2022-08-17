//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
y1=3                        //y1 is depth of the reservoir in 'm'
b=6                         //b is the width of the channel to which water is released in 'm'
a=0.25                      //a is height of the sluice gate in 'm'
y2=1.5                      //y2 is flow depth after all turbulence subside in 'm'


//Assumption
g=9.81                      //g is acceleration due to gravity in 'm/s2'


//Calculation
y1_by_a=y1/a                //y1_by_a is the depth ratio
y2_by_a=y2/a                //y2_by_a is the contraction coefficient
C_d=0.47                    //Determined from FIGURE 13-38 (page number 715) using 'y1_by_a' and 'y2_by_a'.
V_dot=C_d*b*a*sqrt(2*g*y1)  //V_dot is rate of discharge of the water in 'm3/s'


//Display of result
mprintf('\nThe rate of discharge is %.2f m3/s.',V_dot)
