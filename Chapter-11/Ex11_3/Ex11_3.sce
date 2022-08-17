//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory

//Given data
T=40                //T is temperature of the engine oil in '°C'
L=5                 //L is length of the flat plate in 'm'
V=2                 //V is velocity of the engine oil in 'm/s'


//Assumption
Re_c=5E5            //Re_c is the critical Reynolds number
rho=876             //rho is density of the engine oil in 'kg/m3'
Nu=2.485E-4         //Nu is kinematic viscosity of engine oil in 'm2/s'
W=1                 //W is width of the flat plate in 'm'


//Calculation
A=L*W               //A is area of the flat plate in 'm2'
Re=V*L/Nu           //Re is the Reynolds number
if Re<Re_c then
    C_f=1.33/Re^0.5                     //C_f is the average friction co-efficient
else if (Re>Re_c & Re<1E7)
        C_f=(0.074/Re^(1/5))-(1742/Re)  //C_f is the average friction co-efficient
     end
end
F_D=C_f*A*rho*V^2/2//F_D is drag force acting on the plate in 'N'


//Display of result
mprintf('\nThe drag force acting on the entire plate is %.1f N.',F_D)
//The answers vary due to round off error
