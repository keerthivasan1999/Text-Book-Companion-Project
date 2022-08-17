//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//Given data
r1=100                  //r1 is the inlet radius in 'mm'
r2=180                  //r2 is the outlet radius in 'mm'
b1=50                   //b1 is the inlet blade width in 'mm'
b2=30                   //b2 is the outlet blade width in 'mm'
V_dot=0.25              //V_dot is the volume flow rate in 'm3/s'
H=14.5                  //H is the net head in 'm'
n=1720                  //n is the rotational speed of impeller in 'rpm'
V1_t=0                  //V1_t is the tangential velocity component at the inlet in 'm/s'


//Unit conversion
r1=r1/1000               //Conversion from 'mm' to 'm'
b1=b1/1000               //Conversion from 'mm' to 'm'
r2=r2/1000               //Conversion from 'mm' to 'm'
b2=b2/1000               //Conversion from 'mm' to 'm'


//Assumption
g=9.81                  //g is the acceleration due to gravity in 'm/s2'
Eta=1                   //Eta is the efficiency
V_f=0.0008157           //V_f is specific volume of the refrigerent in 'm3/kg'
rho=1226                //rho is the density in 'kg/m3'


//Calculation
W_water_horsepower=rho*g*V_dot*H        //W_water_horsepower is the required water horse power in 'W'
bhp=W_water_horsepower/Eta              //bhp is the required brake horse power in 'W'
bhp=bhp/745.7                           //Conversion from 'W' to 'hp'
Omega=n*(2*%pi)/60                      //Omega is the angular velocity in 'rad/s'
Beta1=atan(V_dot/(2*%pi*b1*Omega*r1^2)) //Beta1 is the balde angle at the inlet in 'radian'
Beta1=Beta1*180/%pi                     //Conversion from 'radian' to '°(degree)'
V2_n=V_dot/(2*%pi*r2*b2)                //V2_n is normal velocity component at the outlet in 'm/s'
V2_t=((H*g)+(Omega*r1*V1_t))/(Omega*r2) //V2_t is the tangential velocity component at the outlet in 'm/s'
Beta2=atan(V2_n/((Omega*r2)-V2_t))      //Beta2 is the balde angle at the outlet in 'radian'
Beta2=Beta2*180/%pi                     //Conversion from 'radian' to '°(degree)'


//Display of result
mprintf('\nThe brake horsepower required by the pump is %d hp.\nBlade angle at the inlet is %.1f°.\nBlade angle at the outlet is %.1f°.',bhp,Beta1,Beta2)
//The answers vary due to round off error
