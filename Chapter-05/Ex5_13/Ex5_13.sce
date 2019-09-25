clc                     //To clear the console screen
clear                   //To clear all the existing Variables in the memory


//Let '1' and '2' be same numbering notations as shown in FIGURE 5-55 page number 211
//Given data
Q=100                   //Q is volume flow rate of water in 'm3/s'
Z1=120                  //m
Z2=0                    //m
h_L=35                  //h_L is total irreversible head loss in the piping system in 'm'
Eta_turbine_gen=0.80    //Eta_turbine_gen is overall efficiency of turbine-generator


//Assumptiom
rho=1000                //rho is water density in 'kg/m3'
P1=101325               //Pa
P2=101325               //Pa
V1=0                    //m/s
V2=0                    //m/s
h_pump=0                //h_pump is head loss due to pump in 'm'
alpha1=1.03             //Assuming flow to be turblent
alpha2=1.03             //Assuming flow to be turblent
g=9.81                  //g is acceleration due to gravity in 'm/s2'


//Calculation
m=rho*Q                                     //m is mass flow rate of water through the turbine in 'kg/s'
h_turbine_e=((P1-P2)/(rho*g))+((alpha1*V1^2/(2*g))-(alpha2*V2^2/(2*g)))+(Z1-Z2)+h_pump-h_L//h_turbine_e is extrscted turbine head in 'm'
W_turbine_e=m*g*h_turbine_e                 //W_turbine is turbine power in 'W'
W_electric=Eta_turbine_gen*W_turbine_e      //W_electricis electric power generated in 'W'
W_electric=W_electric/1E6                   //Conversion from 'W' to 'MW'


//Display of result
mprintf('Electric power output is %.1f MW.',W_electric)

