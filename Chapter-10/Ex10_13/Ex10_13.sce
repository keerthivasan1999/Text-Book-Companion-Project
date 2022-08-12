//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;            //To clear the console screen
clear;          //To clear all the existing variables in the memory
clf(0)          //Clear or reset or reset figure 0
clf(1)          //Clear or reset or reset figure 1


//Given data
T=20            //T is the temperature of air in '°C'
V=10.0          //V is the velocity of air in 'm/s'
L=15.2          //L is length of the smooth flate plate in 'm'


//Assumption
Nu=1.516E-5     //Nu is the kinematic viscosity of air in 'm2/s'
U=10            //U is the velocity component parallel to the wall at a location just above the boundary layer in 'm/s'


//Calculation
X=L             //m
Re_X=V*X/Nu     //Re_X is dimension less Reynolds number
if Re_X<1E5 then
    flow="laminar"
else
    if Re_X>1E5 & Re_X<3E6
    flow="transitional"
    else
        if Re_X>3E6 then
            flow="turblent"
         end
    end
end
Delta=(0.16*X)/(Re_X)^(1/7)     //Delta is the boundary layer thickness in 'm'
C_f_X=0.027/Re_X^(1/7)          //C_f_X is the local skin friction coefficient at the end of the plate
u_star=U*sqrt(C_f_X/2)          //u_star is the friction velocity in 'm/s'
u=0:0.1:U                       //m/s
m=length(u)                     //m is the number of data in 'u' matrix
for i=1:m
    y_oneseventh(i)=Delta*(u(i)/U)^7                    //m
    y_loglaw(i)=Nu/u_star*exp(0.4*((u(i)/u_star)-5))    //m
    y_spalding(i)=(Nu/u_star)*((u(i)/u_star)+(exp(-0.4*5)*(exp(0.4*u(i)/u_star)-1-(0.4*u(i)/u_star)-((0.4*u(i)/u_star)^2/2)-((0.4*u(i)/u_star)^3/6))))//m
    y_plus_oneseventh(i)=y_oneseventh(i)*u_star/Nu
    y_plus_loglaw(i)=y_loglaw(i)*u_star/Nu
    y_plus_spalding(i)=y_spalding(i)*u_star/Nu    
    u_plus(i)=u(i)/u_star
    y_oneseventh(i)=y_oneseventh(i)*1000                //Conversion from 'm' to 'mm'
    y_loglaw(i)=y_loglaw(i)*1000                        //Conversion from 'm' to 'mm'
    y_spalding(i)=y_spalding(i)*1000                    //Conversion from 'm' to 'mm'
end


//Display of result
mprintf('\nFlow is %s from the beginning of the plate.',flow)


//Graph plotting
scf(0)
plot(u,y_loglaw','r',u,y_spalding','k',u,y_oneseventh','b')
xlabel('u,m/s')
ylabel('y,mm')
title('FIGURE 10-118: Comparison of turblent flat plate boundary layer profile expressions in physical variables:One-seventh-power approximation,log law, and spalding law of the wall')
legend(['log law';'spalding law';'1/7th power'],2)


scf(1)
plot(y_plus_oneseventh,u_plus,'k',y_plus_loglaw,u_plus,'r',y_plus_spalding,u_plus,'.r')
xlabel('y_plus')
ylabel('u_plus')
title('FIGURE 10-119: Comparison of turblent flat plate biundary layer profile expressions in law of the wall variables: one-seventh-power approximation, log law, and Spalding law of the wall')
legend(['1/7th power';'log law';'spalding law'],4)

