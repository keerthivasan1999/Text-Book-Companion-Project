clf(0)                  //Clear or reset or reset a figure or a frame uicontrol
clc                     //To clear the console screen
clear                   //To clear all the existing variables in the memory


//Given data
V_m=[20 25 30 35 40 45 50 55 60 65 70]                         //V_m is model wind tunnel speed in 'm/s'
F_D_m=[12.4 19.0 22.1 29.0 34.3 39.9 47.2 55.5 66.0 77.6 89.9] //F_D_m is drag force on the model in 'N'
//Values of V_m and F_D_m are obtained from TABLE 7-7 page number 300.
L_m=0.991               //L_m is length of the model in 'm'
H_m=0.257               //H_m is height of the model in 'm'
W_m=0.159               //W_m is width of the model in 'm'
T_p=25                  //T_p is air temperature in prototype in '°C'
V_p=26.8                //V_p is prototype wind tunnel speed in 'm/s'


//Assumption
//Properties of air  at T_p °C
rho_p=1.184             //rho_p is prototype air density in 'kg/m3'
Mu_p=1.849E-5           //Mu_p is prototype air viscosity in 'kg/(m s)'


//Calculation
W_p=16*W_m              //W_p is width of the prototype in 'm'
A_p=16^2*W_m*H_m        //A_p is the prototype area in 'm2'
count=length(V_m)       //count is number of data in V_m matrix
A_m=W_m*H_m             //A_m is the model area in 'm2'
for i=1:count
    C_D(i)=F_D_m(i)*2/(rho_p*V_m(i)^2*A_m)   //DimensionLess drag co-efficient
    Re_m(i)=rho_p*V_m(i)*W_m/Mu_p            //Re_m is reynolds number of the model
end
Re_p=rho_p*W_p*V_p/Mu_p                      //Re_p is reynolds number of the prototype
F_D_p=0.5*rho_p*V_p^2*A_p*C_D(count)         //F_D_p is drag force on the prototype in 'N'


//Display of result
if Re_p==Re_m(1) then
    mprintf('\nDynamic similarity has been acheived.!')
else 
    mprintf('\nDynamic similarity has not been acheived.!')
end
plot(Re_m,C_D,'r.')
xlabel('Re')
ylabel('C_D')
title('Aerodynamic drag coefficient as a function of the Reynolds number')
mprintf('\nPredicted aerodynamic drag on the prototype is %d N.',F_D_p)
//The answers vary due to round off error
