//SCILAB version: 5.5.2
//Operating system: Windows 7 Ultimate
clc;                    //To clear the console screen
clear;                  //To clear all the existing variables in the memory


//First fsolve16.sci file is executed for finding 'y1' then fsolve17.sci is executed for finding 'y2'.
exec('.\fsolve16.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve16.sci file is saved.
exec('.\fsolve17.sci');
//Replace '.' present inside the 'exec('')' with the path to the folder location where the dependency fsolve17.sci file is saved.


//Given data
b=4                     //b is bottom width of the channel in 'ft'
V_dot=51                //V_dot is volume flow rate of water in 'ft3/s'
Bottom_Drop_1=2         //ft/(1000 ft length)
Bottom_Drop_2=1         //ft/(1000 ft length)


//Assumption
n=0.014                 //n is dimension less Manning coefficient
a=1.486                 //a is a factor with uint 'm^(1/3)/s'


//Calculation
S0_1=Bottom_Drop_1/1000         //S0_1 is the bottom slope 1
S0_2=Bottom_Drop_2/1000         //S0_2 is the bottom slope 2
y1_Guess=1                      //y1_Guess(in 'ft') is the guess value of height 1 used in fsolve function to determine the actual height 1 'y1'.
y2_Guess=1                      //y2_Guess(in 'ft') is the guess value of height 2 used in fsolve function to determine the actual height 2 'y2'.
y1=fsolve(y1_Guess,fsolve16)    //Calling statement for fsolve function to find height 1 'y1'
y2=fsolve(y2_Guess,fsolve17)    //Calling statement for fsolve function to find height 2 'y2'


//Display of result
mprintf('\nHeight of the channel when bottom drop is %d ft/(1000 ft length) is %.1f ft.\nHeight of the channel when bottom drop is %d ft/(1000 ft length) is %.1f ft.',Bottom_Drop_1,y1,Bottom_Drop_2,y2)

