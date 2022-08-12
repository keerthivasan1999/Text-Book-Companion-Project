//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;            //To clear the console screen
clear;          //To clear all the existing variables in the memory


//Given data
T=19            //T is the temperature of the air in '°C'
D=30            //D is the diameter of the wind tunnel in 'cm'
X=30            //X is the length of the wind tunnel in 'cm'
V=4.0           //V is the wind tunnel speed in 'm/s'


//Unit conversion
D=D/100         //Conversion from 'cm' to 'm'
X=X/100         //Conversion from 'cm' to 'm'


//Assumption
Nu=1.507E-5     //Nu is the kinematic vicosity of the air in 'm2/s'
Re_X_cr=5E5     //Re_cr is the critical Reynolds number


//Calculation
//Part (a)
Re_X=V*X/Nu     //Re is the Reynolds number
R=D/2           //R is radius of the wind tunnel in 'm'
//Formula for Delta_star or displacement thickness is obtained from TABLE 10-4 page number 530.
if Re_X<Re_X_cr then
    regime="laminar"
    Delta_star=1.72*X/sqrt(Re_X)        //Delta_star is the displacement thickness at the end of the test section in 'm'
    V_end=V*(R^2/(R-Delta_star)^2)      //V_end is the average air speed at the end of the test section in 'm/s'
else 
    regime="turblent"
    Delta_star=0.020*X/Re_X^(1/7)       //Delta_star is the displacement thickness at the end of the test section in 'm'
    V_end=V*(R^2/(R-Delta_star)^2)      //V_end is the average air speed at the end of the test section in 'm/s'
end
Delta_star=Delta_star*1000              //Conversion from 'm' to 'mm'


//Display of result
mprintf('\n(a) Boundary layer on the wall remains %s throughout the length of the test section.\n    Displacement thickness at end of the test section is %.2f mm.\n    Average speed at the end of the test section is %.2f m/s.',regime,Delta_star,V_end)
