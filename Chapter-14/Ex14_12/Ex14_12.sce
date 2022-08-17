//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory
clf(0)                      //Clear or reset or reset a figure 0
clf(1)                      //Clear or reset or reset a figure 1


//Given data
r2=8.20                     //r2 is the runner inlet radius in 'ft'
r1=5.80                     //r1 is the runner outlet radius in 'ft'
b1=8.60                     //b1 is the runner blade outlet width in 'ft'
b2=3.00                     //b2 is the runner blade inlet width in 'ft'
n=120                       //n is the rotational speed of the runner in 'rpm'
f=60                        //f is the electric generator frequency in 'Hz'
Alpha2=33                   //Alpha2 is the flow angle at runner inlet in '°(degree)'
V_dot=9.50E6                //V_dot is the volume flow rate in 'gpm'
H_gross=303                 //H_gross is the gross head provided by the dam in 'ft'
Alpha1=[10 0 -10]           //Alpha1 is the flow angle at runner outlet in '°(degree)'


//Assumption
rho=998.0                   //rho is the water density in 'kg/m3'
Eta=1                       //Eta is efficiency of the turbine
g=9.81                      //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
Alpha2=Alpha2*%pi/180       //Conversion from '°(degree)' to 'radian'
Alpha1=Alpha1.*%pi/180      //Conversion from '°(degree)' to 'radian'
r1=r1*12*0.0254             //Conversion from 'ft' to 'm'
r2=r2*12*0.0254             //Conversion from 'ft' to 'm'
b1=b1*12*0.0254             //Conversion from 'ft' to 'm'
b2=b2*12*0.0254             //Conversion from 'ft' to 'm'
H_gross=H_gross*12*0.0254   //Conversion from 'ft' to 'm'
V_dot=V_dot*0.00378541/60   //Conversion from 'gpm' to 'm3/s'


//Calculation
Omega=n*(2*%pi)/60          //Omega is the angular velocity in 'rad/s'
V_2_n=V_dot/(2*%pi*r2*b2)   //V_2_n is the inlet normal velocity component in 'm/s'
V_2_t=V_2_n*tan(Alpha2)     //V_2_t is the inlet tangential velocity component in 'm/s'
Beta2=180/%pi*atan(V_2_n/((Omega*r2)-(V_2_t))) //Beta2 is the runner leading edge angle in '°(degree)'
V_1_n=V_dot/(2*%pi*r1*b1)   //V_1_n is the outlet normal velocity component in 'm/s'
m=length(Alpha1)            //m is number of elements in Alpha1 matrix
for i=1:m
    V_1_t(i)=V_1_n*tan(Alpha1(i))                           //V_1_t is the outlet tangential velocity component in 'm/s'
    Beta1(i)=180/%pi*atan(V_1_n/((Omega*r1)-(V_1_t(i))))    //Beta1 is the runner trailing edge angle in '°(degree)'
    W_shaft(i)=rho*Omega*V_dot*((r2*V_2_t)-(r1*V_1_t(i)))   //W_shaft is the shaft output power in 'W'
    bhp(i)=W_shaft(i)/Eta                                   //bhp is the brake horse power in 'W'
    W_shaft(i)=W_shaft(i)/745.7                             //Conversion from 'W' to 'hp'
    H(i)=bhp(i)/(rho*g*V_dot)                               //H is the required net head in 'm'
end
Alpha1=Alpha1./%pi*180          //Conversion from 'radian' to '°(degree)'
bhp=bhp./10^6                   //Conversion from 'W' to 'MW'


//Display of result
//Part (a)
mprintf('\n(a) When runner outlet angle is %d°,\n    Runner leading edge angle is %.1f°.\n    Runner trailing edge angle is %.1f°.\n    The shaft output power is %d hp.\n    Required net head is %.1f m.',Alpha1(1),Beta2,Beta1(1),W_shaft(1),H(1))
//Part (b)
mprintf('\n\n(b) When runner outlet angle is %d°,\n    Runner leading edge angle is %.1f°.\n    Runner trailing edge angle is %.1f°.\n    The shaft output power is %d hp.\n    Required net head is %.1f m.',Alpha1(2),Beta2,Beta1(2),W_shaft(2),H(2))
//Part (c)
mprintf('\n\n(c) When runner outlet angle is %d°,\n    Runner leading edge angle is %.1f°.\n    Runner trailing edge angle is %.1f°.\n    The shaft output power is %d hp.\n    Required net head is %.1f m.',Alpha1(3),Beta2,Beta1(3),W_shaft(3),H(3))


//Graph plotting
scf(0)
plot(Alpha1',bhp,'k')
xlabel('Alpha1,degree')
ylabel('bhp,MW')
title('FIGURE 14-101: Brake horse power output as a function of runner outlet flow angle for the turbine of Example 14-12')
scf(1)
slope_H_gross=0                                 //Slope of the H_gross line is zero
Intercept_H_gross=H_gross                       //Intercept is H_gross in 'm'
H1=slope_H_gross.*Alpha1.^0+Intercept_H_gross    //Defining the equation of the H_gross line in y=mx+c form
plot(Alpha1',H,'r',Alpha1',H1','-.k')
xlabel('Alpha1,degree')
ylabel('H,m')
legend(['H';'H_gross'])
title('FIGURE 14-101: Ideal required net head as a function of runner outlet flow angle for the turbine of Example 14-12')


