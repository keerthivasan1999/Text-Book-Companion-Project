//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                            //To clear the console screen
clear;                          //To clear all the existing variables in the memory
exec('.\fsolve15.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve15.sci file is saved.


//Given data
b=0.4                           //b is width of rectangular channel in 'm'
V_dot=0.2                       //V_dot is volume flow rate of water in 'm3/s'
y_1=0.15                        //y_1 is the flow depth in 'm'


//Assumption
g=9.81                          //g is acceleration due to gravity in 'm/s2'


//Calculation
A_c=b*y_1                       //A_c is area of the channel in 'm2'
V=V_dot/(A_c)                   //V is the average flow velocity in 'm/s'
y_1_c=(V_dot/(g*b^2))^(1/3)     //y_1_c is the critical depth for the flow in 'm'
Fr=V/sqrt(g*y_1)                //Fr is the Froude number
if Fr<1 then
    Flow="subcritical or tranquil"
else
    if Fr==1
        Flow="critical"
    else
        if Fr>1
            Flow="supercritical"
        end
    end
end
E_s1=y_1+((V_dot^2)/(2*g*b^2*y_1^2))    //E_s1 is specific energy in 'm'
E_s2=E_s1                               //m
y_2_Guess=1                             //y_2_Guess is guess alternate depth used is to find actual alternative 'y_1' using the fsolve function
y_2=fsolve(y_2_Guess,fsolve15)          //Calling statement for fsolve function


//Display of result
mprintf('\nAverage flow velocity is %.2f m/s.\nFlow is %s.\nAlternate flow depth is %.2f m.',V,Flow,y_2)
