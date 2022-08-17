//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory


//Given data
V_dot=2             //V_dot is volume flow rate in 'm3/s'
S0=0.001            //S0 is bottom slope


//Assumption
n=0.016             //n is dimension less Manning coefficient
a=1                 //a is a factor with uint 'm^(1/3)/s'
theta=60            //theta is trapezoid angle in '°(degree)'


//Unit conversion
theta=theta*%pi/180 //Conversion from '°(degree)' to 'radian'


//Part (a)
//Calculation
b1=(2*n*V_dot*4^(2/3)/a/sqrt(S0))^(3/8) //b1 is width of the channel in 'm'
y1=b1/2                                 //y1 is height of the channel in 'm'


//Display of result
mprintf('\n(a) Best height of rectangular channel is %.2f m.\n    Best width of the rectangular channel is %.2f m.',y1,b1)


//Part (b)
//Calculation
b2=(n*V_dot/((1+cos(theta))*sqrt(3)*0.5*(sqrt(3)/4)^(2/3)*a*sqrt(S0)))^(3/8)//b2 is width of the channel in 'm'
A_c=0.5*sqrt(3)*b2^2*(1+cos(theta))                                         //A_c is area of the channel in 'm2'
p=3*b2                                                                      //p is perimeter of the channel in 'm'
y2=0.5*sqrt(3)*b2                                                           //y2 is height of the channel in 'm'


//Display of result
mprintf('\n\n(b) Best dimensions of trapezoidal channel are,\n    Width = %.2f m.\n    Height = %.3f m.\n    Trapezoid angle = %d°.',b2,y2,theta*180/%pi)
//The answers vary due to round off error

