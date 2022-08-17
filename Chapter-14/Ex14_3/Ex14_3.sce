//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                            //To clear the console screen
clear;                          //To clear all the existing variables in the memory
clf(0)                          //Clear or reset or reset a figure 0


//Order of dependency file execution: 1.Colebrook.sci, 2.fsolve19.sci, 3.fsolve20.sci
exec('.\Colebrook.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency Colebrook.sci file is saved.
exec('.\fsolve19.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve19.sci file is saved.
exec('.\fsolve20.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve20.sci file is saved.


//Given data
T1=25               //T1 is temperature1 in '°C'
Impeller=11.25      //Impeller is the impeller option in 'in'
Z1=4                //Z1 is the height of the reservoir in 'ft'
Z2=0                //Z2 is the height of the pump in 'ft'
L=10.5              //L is the length of the pipe used in 'ft'
D=4                 //D is the inner diameter of the pipe in 'in'
Epsilon=0.02        //Epsilon is the average inner roughness height in 'in'
Inlet_K_L=0.5       //Inlet_K_L is the inlet loss coefficient
Inlet=1             //Inlet is the number of inlets in the system
Elbow_K_L=0.3       //Elbow_K_L is the elbow loss coefficient
Elbow=3             //Elbow is the number of elbow in the system
Valve_K_L=6         //Valve_K_L is the valve loss coefficient
Valve=1             //Valve is the number of valve in the system


//Assumption
T2=60               //T2 is the temperature2 in °C
P_atm=101325        //P_atm is the atmospheric pressure in 'Pa'
P_v_at_T1=3169      //P_v_at_T1 is the vapor pressure at T1 in 'Pa'
P_v_at_T2=19940     //P_v_at_T2 is the vapor pressure at T2 in 'Pa'
rho_at_T1=997       //rho_at_T1 is the water density at T1 in 'kg/m3'
rho_at_T2=983.3     //rho_at_T2 is the water density at T2 in 'kg/m3'
Mu_at_T1=8.91E-4    //Mu_at_T1 is the water viscosity at T1 in 'kg/(m s)'
Mu_at_T2=4.67E-4    //Mu_at_T2 is the water viscosity at T2 in 'kg/(m s)'
V1=0                //V1 is the velocity in 'm/s'
P1=P_atm            //P1 is the pressure at reservoir in 'Pa'
h_pump=0            //h_pump is the head loss due to pump in 'm'
h_turbine=0         //h_turbine is the head loss due to turbine in 'm'
Alpha1=1.05         //Alpha1 is the velocity correction factor(Assuming the flow to be turblent)
Alpha2=1.05         //Alpha2 is the velocity correction factor(Assuming the flow to be turblent)


//Assumption
V_dot_min=300                                                   //V_dot_min is the minimum volume flow rate in 'gpm' for calculation and graph ploting 
V_dot_max=700                                                   //V_dot_max is the maximum volume flow rate in 'gpm' for calculation and graph ploting
g=9.81                                                          //g is the acceleration due to gravity in 'm/s2'


//Unit conversion
D=D*0.0254                                                      //Conversion from 'in' to 'm'
Epsilon=Epsilon*0.0254                                          //Conversion from 'in' to 'm'
L=L*12*0.0254                                                   //Conversion from 'ft' to 'm'
Z1=Z1*12*0.0254                                                 //Conversion from 'ft' to 'm'
Z2=Z2*12*0.0254                                                 //Conversion from 'ft' to 'm'


//Calculation
R=D/2                                                           //R is the radius in 'm'
Area=%pi*R^2                                                    //Area is the pipe CSA in 'm2'
Epsilon_by_D=Epsilon/D                                          //Epsilon_by_D is the roughness factor
Sigma_K_L=(Inlet_K_L*Inlet)+(Elbow_K_L*Elbow)+(Valve_K_L*Valve) //Sigma_K_L is the total loss coefficient
V_dot=V_dot_min:1:V_dot_max
m=length(V_dot)                                                 //'length' function is used to determine the number volume flow rate generated
for i=1:m
    V_dot(i)=V_dot(i)*0.00378541/60                             //Conversion from 'gpm' to 'm3/s'
    V2(i)=V_dot(i)/Area                                         //V2 is velocity in 'm/s'
    Re_at_T1(i)=rho_at_T1*V2(i)*D/Mu_at_T1                      //Re_at_T1 is the Reynolds number at T1
    f_at_T1(i)=Colebrook(Epsilon_by_D,Re_at_T1(i))              //f_at_T1 is the friction factor at T1 computed using colebrook function
    h_L_at_T1(i)=((f_at_T1(i)*L/D)+Sigma_K_L)*(V2(i)^2/(2*g))   //h_L_at_T1 is the head loss at T1 in 'm'
    NPSH_at_T1(i)=((P_atm-P_v_at_T1)/(rho_at_T1*g))+Z1-Z2-h_L_at_T1(i)-((Alpha2-1)*V2(i)^2/(2*g))
end
for i=1:m
    V2(i)=V_dot(i)/Area                                         //V2 is velocity in 'm/s'
    Re_at_T2(i)=rho_at_T2*V2(i)*D/Mu_at_T2                      //Re_at_T2 is the reynolds number at T2
    f_at_T2(i)=Colebrook(Epsilon_by_D,Re_at_T2(i))              //f_at_T2 is the friction factor at T2 computed using colebrook function
    h_L_at_T2(i)=((f_at_T2(i)*L/D)+Sigma_K_L)*(V2(i)^2/(2*g))   //h_L_at_T2 is the head loss at T2 in 'm'
    NPSH_at_T2(i)=((P_atm-P_v_at_T2)/(rho_at_T2*g))+Z1-Z2-h_L_at_T2(i)-((Alpha2-1)*V2(i)^2/(2*g))
    V_dot(i)=V_dot(i)/0.00378541*60                             //Conversion from 'gpm' to 'm3/s'
end
NPSH_required=[3.8 4 4.5 6 7.5]                                 //NPSH_required is required NPSH in 'ft'
V_dot_required=[300 400 500 600 700]                            //V_dot_required is required volume flow rate in 'gpm'
//NPSH_required and V_dot_required is obtained from FIGURE 14-15 page number 744.
plot(V_dot',NPSH_at_T1,'r',V_dot_required',NPSH_required','k',V_dot',NPSH_at_T2,'b')
xlabel("V_dot,gpm")
ylabel("NPSH,ft")
title("Net positive suction head as a function of volume flow rate at two temperatures. Cavitation is predicted to occur at flow rates greater than the point where the available and required valves of NPSH intersect")
legend('NPSH availabe at 25 °C','NPSH required','NPSH availabe at 60 °C')

k=length(V_dot_required)                                        //'length' function is used to determine the number of flow rate in 'V_dot_required' matrix
//Following loop is to determine the slope and intercept of the 'V_dot_required' vs 'NPSH_required' line. So that point of intersection is determined by sustitution method.
//Assuming the plot between 'V_dot_required' and 'NPSH_required' to be a straight line is the cause for the variation of the final answer from original answer
for i=1:k
    Modified_V_dot_required(i,1)=V_dot_required(i)
    Modified_V_dot_required(i,2)=1
end
Slope_intercept=Modified_V_dot_required\NPSH_required'
VFRGuess_at_T1=550                              //VFRGuess_at_T1 is the guess volume flow rate to find the volume flow rate at the point of intersection of 'NPSH_required' curve and 'NPSH_at_T1' curve by using fsolve function

VFRGuess_at_T1=VFRGuess_at_T1*0.00378541/60     //Conversion from 'gpm' to 'm3/s'
VFR_at_T1=fsolve(VFRGuess_at_T1,fsolve19)       //Calling of fsolve function to determine the actual VFR_at_T1
VFR_at_T1=VFR_at_T1*60/0.00378541               //Conversion from 'm3/s' to 'gpm'
VFRGuess_at_T2=500                              //VFRGuess_at_T2 is the guess volume flow rate to find the volume flow rate at the point of intersection of 'NPSH_required' curve and 'NPSH_at_T2' curve by using fsolve function
VFRGuess_at_T2=VFRGuess_at_T2*0.00378541/60     //Conversion from 'gpm' to 'm3/s'
VFR_at_T2=fsolve(VFRGuess_at_T2,fsolve20)       //Calling of fsolve function to determine the actual VFR_at_T2
VFR_at_T2=VFR_at_T2*60/0.00378541               //Conversion from 'm3/s' to 'gpm' for display purpose
if VFR_at_T2<VFR_at_T1 then
    condition="decreases"
else
    condition="increases"
end


//Display of result
mprintf('\nAt %d °C, cavitation occurs at flow rates above approximately %d gpm.\nMaxiumum volume flow rate without cavitation %s with temperature.\nFor example at %d °C, flow rate above which cavitation occurs is approximately %d gpm.',T1,VFR_at_T1,condition,T2,VFR_at_T2)
//Variation of answer from the actual answer is beacuse assuming plot between V_dot_required and NPSH_required to be a straight line.
