//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory


//Given data
m=0.125                     //m is mass of tennis ball in 'lbm'
D=2.52                      //D is diameter of tennis ball in 'in'
V=45                        //V is velocity of tennis ball in 'mi/h'
Omega=4800                  //Omega is backspin angular velocity of tennis ball in 'rpm'
P=1                         //P is pressure of air in 'atm'
T=80                        //T is temperature of air in '°F'
    

//Assumption
rho=0.07350                 //rho is density of air in 'lbm/ft3'
Nu=1.697E-4                 //Nu is kinematic viscosity of air in 'ft2/s'
g=32.2                      //g is acceleration due to gravity in 'ft/s2'

//Unit conversion
V=V*5280/3600               //COnversion from 'mi/h' to 'ft/s'
Omega=Omega*2*%pi/60        //Conversion from 'rpm' to 'rad/s'
D=D/12                      //Conversion from 'in' to 'ft'


//Calculation
RotationRate=Omega*D/(2*V)  //'RotationRate' is rate of rotation in 'rad'
R=D/2                       //R is radius of the ball in 'ft'
A=%pi*R^2                   //A is frontal area of the ball in 'ft2'
C_L=0.21                    //Lift coefficient corresponding to the 'RotationRate' is determined from FIGURE 11-53 page number 595. If input parameters are changed then 'RotationRate' also changes. So, change 'C_L' accordingly using the FIGURE 11-53.
F_L=C_L*A*rho*V^2/2         //F_L is lift force acting on the ball in '(lbm ft)/s2'
W=m*g                       //W is weight of the ball in '(lbm ft)/s2'
F_L=F_L/g                   //Conversion from '(lbm ft)/s2' to 'lbf'
W=W/g                       //Conversion from '(lbm ft)/s2' to 'lbf'
if  W>F_L then
    State="drop"
else
    State="rise" 
end


//Display of result
mprintf('\nLift force is %.3f lbf.\nWeight of the ball is %.3f lbf.\nThe ball will %s under the combined effect of gravity and lift.',F_L,W,State)
