//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory

//Given data
V_dot_by_L_1=2      //V_dot_by_L_1 is first line source of strength in 'm/s2'
V_dot_by_L_2=-1     //V_dot_by_L_2 is second line source of strength in 'm/s2'
Gamma=1.5           //Gamma is a line vortex of strength in 'm/s2'
x_1=0               //x_1 is the x-coordinate of first line source of strength
y_1=-1              //y_1 is the y-coordinate of first line source of strength
x_2=1               //x_2 is the x-coordinate of second line source of strength
y_2=-1              //y_2 is the y-coordinate of second line source of strength
x_v=1               //x_v is the x-coordinate of line vortex of strength
y_v=1               //y_v is the y-coordinate of line vortex of strength
x=1                 //x is the x-coordinate of the point where the fluid velocity is to be found
y=0                 //y is the y-coordinate of the point where the fluid velocity is to be found


//Assumption
Angle=45            //'Angle' is the angle made by the first line source with the x-axis.


//Unit conversion
Angle=Angle*%pi/180 //Conversion from 'radian' to '(degree)'


//Calculation
r_vortex=y_v-y                                  //m
r_source_2=y-y_2                                //m
r_source_1=1/sin(Angle)                         //m
V_vortex=Gamma/(2*%pi*r_vortex)                 //V_vortex is the velocity induced by the vortex in 'm/s'
V_source_1=abs(V_dot_by_L_1)/(2*%pi*r_source_1) //V_source_1 is the velocity induced by the first source in 'm/s'
V_source_2=abs(V_dot_by_L_2)/(2*%pi*r_source_2) //V_source_2 is the velocity induced by the second source in 'm/s'


//Display of result
mprintf('The superposed velocity at the point (%d,%d) is (%.3f i + %d j) m/s',x,y,(V_vortex + (V_source_1)/r_source_1), (V_source_1/r_source_1)-(V_source_2))
