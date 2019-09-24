clc     //To clear the console screen
clear   //To clear all the existing variables in the memory


//Given data
h=50                //h is depth of the water in the lake in 'm'
m=5000       //m is mass flow rate of water in 'kg/s'
W_elect_out=1862              //W_elect_out is electric power generated in 'kW'
Eta_generator=0.95       //Eta_generator is efficiency of the generator


//Assumption
rho=1000       //rho is water density in 'kg/m3'
g=9.81//g is acceleration due to gravity in 'm/s2'


//Part (a)
//Calculation
MechEnergyChange=g*h                    //m2/s2
MechEnergyChange=MechEnergyChange/1000//Conversion from 'm2/s2' to 'kJ/kg'
Delta_E_mech_fluid=abs(m*MechEnergyChange)    //Delta_E_mech_fluid is the rate at which mechanical energy is supplied to the turbine in 'kW'
Eta_turbine_gen=W_elect_out/Delta_E_mech_fluid                      //Eta_turbine_gen is the overall efficiency


//Display of result
mprintf('\n\n(a) Overall efficiency is %.2f.',Eta_turbine_gen)


//Part (b)
//Calculation
Eta_turbine=Eta_turbine_gen/Eta_generator                  //Eta_turbine is the mechanical efficiency of the turbine


//Display of result
mprintf('\n(b) Turbine efficiency is %.2f.',Eta_turbine)


//Part (C)
//Calculation
W_shaft_out=Eta_turbine*Delta_E_mech_fluid                 //W_shaft_out is the shaft power output in 'kW'


//Display of result
mprintf('\n(c) Shaft power output is %d kW.',W_shaft_out)
//The answers vary due to round off error
