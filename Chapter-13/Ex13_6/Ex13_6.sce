//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory
exec('.\ManningEquation2.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency ManningEquation2.sci file is saved.


//Given data
b=6                         //b is width of the channel in 'm'
y=2                         //y is flow depth in 'm'
S0=0.004                    //S0 is bottom slope of the channel


//Assumption
n=0.014                     //n is dimension less Manning coefficient
a=1                         //a is a factor with uint 'm^(1/3)/s'
g=9.81                      //g is acceleration due to gravity in 'm/s2'


//Calculation
A_c=y*b                     //A_c is cross sectional area of the channel in 'm2'
p=b+(2*y)                   //p is perimeter of the channel in 'm'
R_h=A_c/p                   //R_h is hydraulic radius of the channel in 'm'
y_n=y                       //y_n is normal depth in 'm' when flow is uniform
V_dot=ManningEquation2()     //'ManningEquation' function calling statement
y_c=V_dot^2/(g*A_c^2)       //y_c is critical depth of the flow in 'm'
if y_c<y_n then
    channelslope="mild"
else
    if y_c>y_n then
        channelslope="steep"
    else 
        if y_c == y_n then
            channelslope="critical"
        end
    end
end


//Display of result
mprintf('\nVolume flow rate is %.1f m3/s.',V_dot)
mprintf('\nCritical depth is %.1f m.',y_c) //The answer provided in the textbook is wrong
mprintf('\nSo the channel is %s.',channelslope)
