clc                 //To clear the console screen
clear               //To clear all the existing Variables in the memory


//Given data
Q_total=20          //Q_total is rate at which water enters the sprinkler in 'L/s'
n=300               //n is rotational speed of the sprinkler in 'rpm'
D=1                 //D is diameter of the jet in 'cm '
r=0.6               //r is distance between axis and centre of each nozzle in 'm'
Arms=4              //Arms is number arms present in the sprinkler


//Unit conversion
Q_total=Q_total/1000//Conversion from 'L/s' to 'm3/s'
D=D/100             //Conversion from 'cm' to 'm'


//Assumption
rho=1000            //rho is water density in 'kg/m3'


//Calculation
R=D/2                   //R is radius of the jet in 'm'
A_jet=%pi*R^2           //A_jet is the area covered by a jet in 'm2'
m_total=rho*Q_total     //m_total is the total mass flow rate in 'kg/s'
Q_nozzle=Q_total/Arms   //Q_nozzle is volume flow rate in each nozzle in 'm3/s'
V_jet=Q_nozzle/A_jet    //V_jet is the average jet exit velocity relative to the nozzle in 'm/s'
Omega=2*%pi*n/60        //Omega is angular velocity of the nozzle in 'rad/s'
V_nozzle=r*Omega        //V_nozzle is tangential velocity of the nozzle in 'm/s'
V_r=V_jet-V_nozzle      //V_r is the average velocity of the water jet in 'm/s'
T_shaft=r*m_total*V_r   //T_shaft is torque transmitted through the shaft in 'Nm'
W=Omega*T_shaft         //W is the power generated in 'W'
W=W/1000                //Conversion from 'W' to 'kW'


//Diplay of result
mprintf('\nSprinkler type turbine has the potential to produce %.1f kW.',W)
