//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                        //To clear the console screen
clear;                      //To clear all the existing variables in the memory
exec('.\fsolve10.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve10.sci file is saved.


//Let '1' and '2' be the same naming notations as shown in 12-48 page number 646.
//Given data 
Ma_1=2                      //Ma_1 is Mach number of super sonic air
P_1=75                      //P_1 is pressure of the super sonic air in 'kPa'
delta=10                    //delta is the half angle of a 2D wedge in '°(degree)'


//Assumption
k=1.4                       //k is specific heat ratio
Beta_weak_Guess=10          //Beta_weak_Guess is guess weak shock angle(in '°(degree)') used to calculate actual weak shock angle
Beta_strong_Guess=90        //Beta_strong_Guess is guess strong shock angle(in '°(degree)') used to calculate actual strong shock angle


//Unit conversion
Beta_weak_Guess=Beta_weak_Guess*%pi/180                                 //Conversion from '°(degree)' to 'radian'
Beta_strong_Guess=Beta_strong_Guess*%pi/180                             //Conversion from '°(degree)' to 'radian'


//Calculation
theta=delta;                                                            //theta is oblique shock deflection angle in '°(degree)'
theta=theta*%pi/180                                                     //Conversion from '°(degree)' to 'radian'
Beta_weak=fsolve(Beta_weak_Guess,fsolve10)                              //fsolve function to calcualte weak shock angle
Beta_strong=fsolve(Beta_strong_Guess,fsolve10)                          //fsolve function to calcualte strong shock angle
Ma_1_n_weak=Ma_1*sin(Beta_weak)                                         //Ma_1_n_weak is weak upstream normal Mach number
P_2_weak=P_1*(((2*k*Ma_1_n_weak^2)-k+1)/(k+1))                          //P_2_weak is weak downstream pressure in 'kPa'
Ma_2_n_weak=sqrt((((k-1)*Ma_1_n_weak^2)+2)/(((2*k*Ma_1_n_weak^2)-k)+1)) //Ma_2_n_weak is weak downstream normal Mach number
Ma2_weak_downstream=Ma_2_n_weak/sin(Beta_weak-theta)                    //Ma2_weak_downstream is weak downstream Mach number
Ma_1_n_strong=Ma_1*sin(Beta_strong)                                     //Ma_1_n_strong is strong upstream normal Mach number
P_2_strong=P_1*(((2*k*Ma_1_n_strong^2)-k+1)/(k+1))                      //P_2_strong is strong downstream pressure in 'kPa'
Ma_2_n_strong=sqrt((((k-1)*Ma_1_n_strong^2)+2)/(((2*k*Ma_1_n_strong^2)-k)+1))   //Ma_2_strong is strong downstream normal Mach number
Ma2_strong_downstream=Ma_2_n_strong/sin(Beta_strong-theta)                      //Ma2_strong_downstream is strong downstream Mach number


//Display of result
mprintf('\nWeak shock angle is %.1f°.\nWeak shock downstream pressure is %d kPa.\nWeak shock downstream Mach number is %.2f.\n\nStrong shock angle is %.1f°.\nStrong shock downstream pressure is %d kPa.\nStrong shock downstream Mach number is %.3f.',Beta_weak*180/%pi,P_2_weak,Ma2_weak_downstream,Beta_strong*180/%pi,P_2_strong,Ma2_strong_downstream)
//The answers vary due to round off error
