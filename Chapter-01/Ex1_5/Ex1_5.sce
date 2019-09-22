clc                 //To clear the console screen
clear               //To clear all the existing variables in the memory


//Following is the function to determine the two number using 'fsolve' function
function f=F(Number)
    f(1)=Number(1)-Number(2)-Difference
    f(2)=Number(1)^2-Number(1)+Number(2)^2-Number(2)-Sum
endfunction


//Given data
Difference=4        //Difference is the difference between the numbers
Sum=20


//Calculation
Number0=[1 1]           //Number0 is the matrix containing guess value for the actual numbers
Number=fsolve(Number0,F)//Number is the matrix consisting 'x' and 'y'.


//Display of result
mprintf('\nNumbers are %d and %d.',Number(1),Number(2))
