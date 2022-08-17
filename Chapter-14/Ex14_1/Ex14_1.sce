//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                                        //To clear the console screen
clear;                                      //To clear all the existing variables in the memory
clf(0)                                      //Clear or reset or reset a figure 0
exec('.\fsolve18.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve18.sci file is saved.


//Given data
V_dot_from_table=[0 250 500 750 1000 1200]  //V_dot_from_table is volume flow rate in 'cfm' from TABLE 14-1
H_available=[0.90 0.95 0.90 0.75 0.40 0]    //H_available is head in 'in of water' from TABLE 14-1
D=9.06                                      //D is the inner diameter of the duct in 'in'
L=44                                        //L is the total length of duct in 'ft'
epsilon=0.15                                //epsilon is the equivalent roughness height in 'mm'
V_dot_given=600                             //V_dot_given is the minimum volume flow rate through the duct in 'ft3/min'
T=25                                        //T is the temperature of duct in '°C'
Elbow=5                                     //Elbow is the number of elbows along the duct
Damper=1                                    //Damper is the number of dampers present along the duct
Entry_K_L=1.3                               //Entry_K_L is the entry loss coefficient
Damper_K_L=1.8                              //Damper_K_L is the damper loss coefficient
Elbow_K_L=0.21                              //Elbow_K_L is the elbow loss coefficient
Fan_ID=9                                    //Fan_ID is fan inlet diameter in 'in'
Fan_OD=0                                    //Fan_OD is the fan outlet diameter in 'in'


//Assumption
v=1.562E-5                                  //v is the air vicosity in 'm2/s'
rho_air=1.184                               //rho_air is the air density in 'kg/m3'
rho_water=998                               //rho_water is the water density in 'kg/m3'
P1=101325                                   //P1 is the pressure in the reservoir in 'Pa'
P2=101325                                   //P2 is the prssure in the pipe outlet in 'Pa'
V1=0                                        //V1 is the velocity in the reservoir in 'm/s'
Alpha1=1.05                                 //Assuming the flow to be turblent
Alpha2=1.05                                 //Assuming the flow to be turblent
g=9.81                                      //g is the acceleration due to gravity in 'm/s2'
V_dot_min=1                                 //V_dot_min is the minimum volume flow rate for calculation in 'ft3/min'
V_dot_max=1200                              //V_dot_max is the maximum volume flow rate for calculation in 'ft3/min'


//Unit conversion
D=D*0.0254                                  //Conversion from 'in' to 'm'
epsilon=epsilon/1000                        //Conversion from 'mm' to 'm'
L=L*12*0.0254                               //Conversion from 'ft' to 'm'


//Calculation
f0=0.01                                                                 //f0 is guess friction factor which is used to determine the actual friction factor using fsolve function
Sigma_K_L=Entry_K_L+(Damper*Damper_K_L)+(Elbow*Elbow_K_L)               //Sigma_K_L is total loss coefficient
R=D/2                                                                   //R is radius of the duct in 'm'
A=%pi*R^2                                                               //A is the CSA of the duct in 'm2'
epsilon_by_D=epsilon/D                                                  //epsilon_by_D is the roughness factor
V_dot=V_dot_min:1:V_dot_max
m=length(V_dot)                                                         //m is the number of volume flow rate generated
for i=1:m
    V_dot(i)=V_dot(i)*(12*0.0254)^3/60                                  //Conversion from 'ft3/min' to 'm3/s'
    Re(i)=4*V_dot(i)/(v*%pi*D)                                          //Re is dimension less Reynolds number
    Rey=Re(i)                                                           //Rey is Reynolds number used in the 'fsolve18' function
    f(i)=fsolve(f0,fsolve18)                                            //calling statement for fsolve function
    V2(i)=V_dot(i)/A                                                    //V2 is the velocity at the pipe outlet in 'm/s'
    H_required(i)=(Alpha2+(f(i)*L/D)+Sigma_K_L)*(V2(i)^2/(2*g))         //H_required is head in 'm of air'
    H_required_inchesofwater(i)=H_required(i)*(rho_air/rho_water)       //H_required_inchesofwater is head in 'm of water'
    H_required_inchesofwater(i)=H_required_inchesofwater(i)/0.0254      //Conversion from 'm of water' to 'in of water'
    V_dot(i)=V_dot(i)/(12*0.0254)^3*60                                  //Conversion from 'm3/s' to 'ft3/min'
end
plot(V_dot',H_required_inchesofwater,'k',V_dot_from_table',H_available','r.-')
xlabel("V_dot,cfm")
ylabel("H,inches H2O")
legend(['H_required';'H_available'],2)
title("FIGURE 41-13: Net head as a function of volume flow rate for the ventilation system of Example 14-1.The point where the available and required values of H interest is the operating point")
//Following values are obtained from the point of intersection of the H_required and H_available curve present in FIGURE 14-13
V_dot_operating=650                                                     //x co-ordinate of the point of intersection in 'cfm'
H_required_Operating=0.83                                               //y co-ordinate of the point of intersection in 'inches of water'
H_available_operating=0.83                                              //y co-ordinate of the point of intersection in 'inches of water'


//Display of result
mprintf('\nOperating point volume flow rate is %d cfm.\nRequired and available at this operating point are %.2f and %.2f inches of water respectively.',V_dot_operating,H_required_Operating,H_available_operating)
