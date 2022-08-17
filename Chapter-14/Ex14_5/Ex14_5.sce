//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
n=1750                  //n is the rotational speed of blower in 'rpm'
Alpha1=0                //Alpha1 is the air inlet angle in '°(degree)'
Alpha2=40               //Alpha2 is the air exit angle in '°(degree)'
r1=4                    //r1 is the inlet radius in 'cm'
b1=5.2                  //b1 is the inlet blade width in 'cm'
r2=8                    //r2 is the outlet radius in 'cm'
b2=2.3                  //b2 is the outlet blade width in 'cm'
V_dot=0.13              //V_dot is the volume flow rate in 'm3/s'
Eta=1                   //Eta is the efficiency


//Unit conversion
r1=r1/100               //Conversion from 'cm' to 'm'
b1=b1/100               //Conversion from 'cm' to 'm'
r2=r2/100               //Conversion from 'cm' to 'm'
b2=b2/100               //Conversion from 'cm' to 'm'
Alpha1=Alpha1*%pi/180   //Conversion from '°(degree)' to 'radian'
Alpha2=Alpha2*%pi/180   //Conversion from '°(degree)' to 'radian'


//Assumption
g=9.81                  //g is the acceleration due to gravity in 'm/s2'
rho_air=1.20            //rho_air is the density of air in 'kg/m3'
rho_water=998           //rho_water is the density of water in 'kg/m3'


//Calculation
V1_n=V_dot/(2*%pi*r1*b1)                //V1_n is normal velocity component at the inlet in 'm/s'
V1_t=V1_n*tan(Alpha1)                   //V1_t is the tangential velocity component at the inlet in 'm/s'
V2_n=V_dot/(2*%pi*r2*b2)                //V2_n is normal velocity component at the outlet in 'm/s'
V2_t=V2_n*tan(Alpha2)                   //V2_t is the tangential velocity component at the outlet in 'm/s'
Omega=n*(2*%pi)/60                      //Omega is the angular velocity in 'rad/s'
H=Omega*((r2*V2_t)-(r1*V1_t))/g         //H is the net head in 'm of air'
H_water_column=H*rho_air/rho_water      //H_water_column is the net head in 'm of water'
H_water_column=H_water_column*1000      //Conversion from 'm of water' to 'mm of water'
bhp=rho_air*g*V_dot*H                   //bhp is the brake horse power in 'W'


//Display of result
mprintf('\nNet head is %.1f mm of water.\nRequired brake horse power is %.1f W.',H_water_column,bhp)
