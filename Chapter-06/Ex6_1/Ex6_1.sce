clc                                 //To clear the console screen
clear                               //To clear all the existing Variables in the memory


//Calculation
Beta=integrate('-4*y^2','y',1,0)    //Beta is the momentum flux correction factor


//Display of result
mprintf("\nMomentum flux correction factor is %f.",Beta)
