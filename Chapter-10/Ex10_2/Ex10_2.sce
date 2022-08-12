//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                //To clear the console screen
clear;              //To clear all the existing variables in the memory

//Given data
D=50                //D is diameter of the particle in 'μm'
T=-50               //T is the air temperature in '°C'
P=55                //P is the air pressure in 'kPa'
rho_particle=1240   //rho_particle is the particle density in 'kg/m3'


//Assumption
rho_air=0.8588      //rho_air is the air density in 'kg/m3'
Mu_air=1.474E-5     //Mu_air is the air viscosity in 'kg/(m s)'
g=9.81              //g is the acceleration due to gravity in 'm/s2'
Phi_particle=1      //Phi_particle is the sphericity of the particle


//Unit conversion 
D=D*10^-6           //Conversion form 'μm' to 'm'


//Calculation
V=g*D^2*(rho_particle-rho_air)/(18*Mu_air)//V is the terminal velocity in 'm/s'
Re=rho_air*V*D/(Mu_air)                   //Re is the dimension less Reynolds number
Regime="stokes"
if Re>1000 then
    Regime="newtons"
    V=1.74077656*sqrt(D*g*(rho_particle-rho_air)/rho_air)                       //V is the terminal velocity in 'm/s'
    Re=rho_air*V*D/(Mu_air)                                                     //Re is the dimension less reynolds number
else 
    if Re>1 & Re<1000 then
        Regime="intermediate"
        Ar=4*D^3*rho_air*g*(rho_paricle-rho_air)/(3*Mu_air^2)                   //Ar is the Archimedes number 
        dp_star=(3*Ar/4)^(1/3)                                                  //dp_star is the dimension less particle diameter
        ut_star=((18/dp_star^2)+((2.335-(1.744*Phi_particle))/dp_star^0.5))^-1  //ut_star is the dimension less velocity
        V=ut_star/(rho_air^2/(Mu_air*g*(rho_particle-rho_air)))^(1/3)           //V is the terminal velocity in 'm/s'
        Re=rho_air*V*D/(Mu_air)                                                 //Re is the dimension less reynolds number
    end 
end


//Display of result
mprintf('\nSettling is in %s regime.\n\nTerminal velocity is %.3f m/s.\nReynolds number is %.3f.',Regime,V,Re)
//The answers vary due to round off error
