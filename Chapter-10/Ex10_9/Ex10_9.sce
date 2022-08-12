//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;            //To clear the console screen
clear;          //To clear all the existing variables in the memory


//Given data
V=5.0           //V is the speed of canoe in 'mi/h'
T=50            //T is the temperature of the lake water in '°F'
X=16            //X is the length of bottom of the canoe in 'ft'


//Unit conversion
V=V*5280/3600   //Conversion from 'mi/h' to 'ft/s'


//Assumption
Nu=1.407E-5     //Nu is the kinematic viscosity of water in 'ft2/s'
Re_X_cr=5E5     //Re_cr is the critical Reynolds number


//Calculation
Re_X=V*X/Nu     //Re is the Reynolds number
if Re_X>Re_X_cr then
    regime="turblent"
else 
    if Re_X<Re_X_cr then
        regime="laminar"
    end
end


//Display of result
mprintf('\nThe boundary layer on the canoe bottom is %s.',regime)
