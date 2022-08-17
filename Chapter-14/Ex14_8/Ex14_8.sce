//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
Beta_sl=0                   //Beta_sl is the stator blade leading edge angle in '°(degree)'
Beta_st=60                  //Beta_st is the stator blade trailing edge angle in '°(degree)'
stator=16                   //stator is the number of stator blade
V_in=47.1                   //V_in is the axial flow speed through the blades in 'm/s'
n=1750                      //n is the rotational speed of propeller in 'rpm'
r=0.4                       //r is the radius of the fan in 'm'


//Unit conversion
Beta_sl=Beta_sl*%pi/180     //Conversion from '°(degree)' to 'radian'
Beta_st=Beta_st*%pi/180     //Conversion from '°(degree)' to 'radian'


//Calculation
V_st=V_in/cos(Beta_st)      //V_st is the velocity leaving the trailing edge of the stator blade in 'm/s'
Omega=n*(2*%pi)/60          //Omega is the angular velocity in 'rad/s'
u_theta=Omega*r             //u_theta is the tangential velocity of the rotor blade in 'm/s'
Beta_rl=atan((u_theta+(V_in*tan(Beta_st)))/V_in) //Beta_rl is the rotor blade leading edge angle in 'radian'
Beta_rl=Beta_rl*180/%pi     //Conversion from 'radian' to '°(degree)'
Beta_rt=atan(u_theta/V_in)  //Beta_rt is the rotor blade trailing edge angle in 'radian'
Beta_rt=Beta_rt*180/%pi     //Conversion from 'radian' to '°(degree)'
//Following code is to determine the number of rotor blades by finding the numbers which don't have a common denominator with the number of stator blade
i=stator
k=1
for j=i-4:i+4
    if  gcd([i j])==1 then  //if gcd([i j]) returns 1, it means there is no common divisor for i and j other than '1'.
        Rotar_blade(k)=j
        k=k+1
    end
end


//Display of result
mprintf('\nThe leading edge angle of rotor blade is %.2f°.\nThe trailing edge angle of the rotor blade is %.2f°.',Beta_rl,Beta_rt)
mprintf('\nNumber of rotor blades can be a number like')
disp(Rotar_blade')
