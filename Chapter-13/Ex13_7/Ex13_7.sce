//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory


//Let '1' and '2' be the same numbering notations as that of FIGURE 12-35 page number 712.
//Given data
b=10                //b is width of the rectangular channel in 'm'
y1=0.8              //y1 is flow depth before the jump in 'm'
v1=7                //v1 is velocity before the jump in 'm/s'


//Assumption
rho=1000            //rho is density of water in 'kg/m3'
g=9.81              //g is acceleration due to gravity in 'm/s2'


//Calculation
Fr1=v1/sqrt(g*y1)   //Fr1 is Froude number before the hydraulic jump
if Fr1>1 then
    //Part (a)
    Flow="supercritical"
    y2=0.5*y1*(-1+sqrt(1+(8*Fr1^2)))    //y2 is flow depth after the jump in 'm'
    v2=y1*v1/y2                         //v2 is velocity after the jump in 'm/s'
    Fr2=v2/sqrt(g*y2)                   //Fr2 is Froude number after the jump
    
    
    //Display of result
    mprintf('\n(a) Flow is %s.\n    Depth after jump is %.2f m.\n    Velocity after jump is %.2f m/s.\n    Froude number after jump is %.3f.',Flow,y2,v2,Fr2)
    //The answers vary due to round off error
    
    
    //Part (b)
    h_L=y1-y2+((v1^2-v2^2)/(2*g))       //h_L is head loss in 'm'
    E_s1=y1+(v1^2/(2*g))                //E_s1 is specific energy of water before the jump in 'm'
    Dissipation_Ratio=h_L/E_s1
    
    
    //Display of result
    mprintf('\n\n(b) Head loss is %.3f m.\n    Specific energy of water before jump is %.2f m.\n    Dissipation ratio is %.3f.',h_L,E_s1,Dissipation_Ratio)
    //The answers vary due to round off error
    
    
    //Part (c)
    m=rho*b*y1*v1                       //m is mass flow rate of water in 'kg/s'
    E_dissipated=m*g*h_L                //E_dissipated is power dissipation in 'W'
    E_dissipated=E_dissipated/1000      //Conversion from 'W' to 'kW'
    
    
    //Display of result
    mprintf('\n\n(c) Mass flow rate of water is %d kg/s.\n    Power dissipated is %d kW.',m,E_dissipated)
    //The answers vary due to round off error
else
    mprintf('\n(a) Flow is subcritical so, hydraulic jump is not possible...!')
end





