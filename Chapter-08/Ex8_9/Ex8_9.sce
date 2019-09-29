clc     //To clear the console screen
clear   //To clear all the existing variables in the memory


//Let '1','2' and '3' be same naming notations as that of FIGURE 8-49 page number 362
//Following is the function to determine Volume flow rate x(1), Friction factor x(2), Velocity x(3), Reynolds number x(4) by solving 4 non linear equations using fsolve function
function f1=F1(x)
    f1(1)=(h_L*2*g)-((Sigma_K_L_shower+((L_shower/D)*x(2)))*x(3)^2)
    f1(2)=x(3)-(x(1)/A)
    f1(3)=x(4)-(x(3)*D/Nu)
    f1(4)=(1/x(2))-(4*(log10((Epsilon_by_D/3.7)+(2.51/(x(4)*sqrt(x(2))))))^2)
endfunction


//Following is the function to determine Total volume flow rate (y(1)), volume flow rate 1 (y(2)), volume flow rate 2 (y(3)), Friction factor 1 (y(4)), Friction factor 2 (y(5)), Friction factor 3 (y(6)), Velocity 1 (y(7)), Velocity 2 (y(8)), Velocity 3 (y(9)), Reynolds number 1 (y(10)), Reynolds number 2 (y(11)) and  Reynolds number 3 (y(12))  by solving 12 non linear equations using fsolve function
function f2=F2(y)
    f2(1)=y(1)-y(2)-y(3)
    f2(2)=(h_L*2*g)-((y(4)*y(7)^2*Length1/D)+(((y(5)*Length2/D)+Sigma_K_L_shower)*(y(8)^2)))
    f2(3)=(h_L_3*2*g)-((y(4)*y(7)^2*Length1/D)+(((y(6)*Length3/D)+Sigma_K_L_reservoir)*(y(9)^2)))
    f2(4)=y(7)-(y(1)/A)
    f2(5)=y(8)-(y(2)/A)
    f2(6)=y(9)-(y(3)/A)
    f2(7)=y(10)-(D*y(7)/Nu)
    f2(8)=y(11)-(D*y(8)/Nu)
    f2(9)=y(12)-(D*y(9)/Nu)
    f2(10)=(1/y(4))-(4*(log10(Epsilon_by_D+(2.51/(y(10)*sqrt(y(4))))))^2)
    f2(11)=(1/y(5))-(4*(log10(Epsilon_by_D+(2.51/(y(11)*sqrt(y(5))))))^2)
    f2(12)=(1/y(6))-(4*(log10(Epsilon_by_D+(2.51/(y(12)*sqrt(y(6))))))^2)
endfunction


//Given data
D=1.5                   //D is diameter of the copper pipe in 'cm'
P1=200                  //P1 is pressure at the inlet in 'kPa gage'
K_L_shower=12           //K_L_shower is the loss co-efficient of shower
K_L_reservoir=14        //K_L_reservoir is the loss co-efficient of reservoir
n_tee_shower=1          //n_tee_shower is the number of tee in shower-inlet pipe
n_elbow_shower=2        //n_elbow_shower is number of elbow in the shower-inlet pipe
n_valve_shower=1        //n_valve_shower is number of valve in the shower-inlet pipe
n_tee_reservoir=1       //n_tee_reservoir is number of tee in the reservoir-inlet pipe
n_valve_reservoir=1     //n_valve_reservoir is number of valve in the reservoir-inlet pipe
n_elbow_reservoir=1     //n_elbow_reservoir is number of elbow in the reservoir-inlet pipe
Z3=1                    //Z3 is the elevation of the shower in 'm'
Z2=2                    //Z2 is the elevation of the reservoir in 'm'
Z1=0                    //Z1 is the elevation for the inlet location in 'm'
L_shower=11             //L_shower is the total length of the pipe connecting the inlet and the shower in 'm'
Length1=5               //m
Length2=6               //m
Length3=1               //m


//Unit conversion
P1=(P1*1000)+101325     //Conversion from 'kPa gage' to 'Pa absolute'
D=D/100                 //Conversion from 'cm' to 'm'


//Assumption
rho=998                 //rho is density of the water in 'kg/m3'
Mu=1.002E-3             //Mu is dynamic viscosity of the water in 'kg/(m s)'
Nu=1.004E-6             //Nu is kinematic viscosity of the water in 'm2/s'
Epsilon=1.5E-6          //Epsilon is equivalent roughness value in 'm'
K_L_tee=0.9             //K_L_tee is the loss co-efficient of tee
K_L_elbow=0.9           //K_L_elbow is the loss co-efficient of elbow
K_L_valve=10            //K_L_valve is the loss co-efficient of valve
P2=101325               //P2 is pressure at the reservoir in 'Pa'
P3=101325               //P3 is pressure at the shower in 'Pa'
V1=0                    //V1 is velocity of water at the inlet in 'm/s'
V2=0                    //V2 is velocity of water in the reservoir in 'm/s'
V3=0                    //V3 is velocity of water coming from the shower in 'm/s'
Alpha1=1.03             //Alpha1 is the kinetic energy correction factor(Assuming flow to be turblent)
Alpha2=1.03             //Alpha1 is the kinetic energy correction factor(Assuming flow to be turblent)
Alpha3=1.03             //Alpha1 is the kinetic energy correction factor(Assuming flow to be turblent)
g=9.81                  //g is acceleration due to gravity in 'm/s2'
h_pump_u=0              //h_pump_u is the useful pump head delivered to the water in 'm'
h_turbine_e=0           //h_turbine_e is the turbine head extracted from the water in 'm'


//Part (a)
//Calculation
Sigma_K_L_shower=(n_tee_shower*K_L_tee)+(n_elbow_shower*K_L_elbow)+(n_valve_shower*K_L_valve)+(K_L_shower)
//Sigma_K_L_shower is the total loss coefficient in shower-inlet pipeline
h_L=(P1/(rho*g))-(P2/(rho*g))+(Alpha1*V1^2/(2*g))-(Alpha2*V2^2/(2*g))+Z1-Z2+h_pump_u-h_turbine_e //h_l is head loss in 'm'
R=D/2                   //R is radius of the pipe in 'm'
A=%pi*R^2               //A is area of the pipe in 'm2'
Epsilon_by_D=Epsilon/D  //Epsilon_by_D is the roughness factor of the pipe 
x0=[0.0001 0.01 5 20000]//Guess values for calculating actual values using fsolve function
x=fsolve(x0,F1)         //fsolve function calling statement


//Display of result
mprintf('\n(a) Flow rate of water through the shower head is %.5f m3/s or %.2f L/s.',x(1),x(1)*1000)


//Part (b)
//Calculation
Sigma_K_L_reservoir=(n_tee_reservoir*K_L_tee)+(n_elbow_reservoir*K_L_elbow)+(n_valve_reservoir*K_L_valve)+(K_L_reservoir)
//Sigma_K_L_reservoir is the total loss coefficient in reservoir-inlet pipeline
h_L_3=(P1/(rho*g))-(P3/(rho*g))+(Alpha1*V1^2/(2*g))-(Alpha3*V3^2/(2*g))+Z1-Z3+h_pump_u-h_turbine_e
//h_L_3 is head loss in the reservoir branch in 'm'
y0=[0.001 0.001 0.0001 0.01 0.01 0.01 3 3 3 10000 10000 10000]  //Guess values for calculating actual values using fsolve function
y=fsolve(y0,F2)                                                 //fsolve function calling statement
Reduction=(x(1)-y(2))*100/x(1)                                  //Reduction is the reduction in the water flow rate in '%'


//Display of result
mprintf('\n(b) Flushing of toilet reduces flow rate through the shower by %d percent from %.2f to %.2f L/s.',Reduction,x(1)*1000,y(2)*1000)
//The answers vary due to round off error
