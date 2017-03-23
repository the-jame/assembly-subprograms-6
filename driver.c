#include <stdio.h>

double main_asm(void);

int main(){
double final;

 printf("This driver program starts Assignment 6 by James Philippon.\n");
 printf("\nWelcome to Array Processing\n");

 final=main_asm();   // assume that the end of array is 0.0
 printf("\nThe driver received this number:%1.10lf\n",final);
 
 printf("\nHave a nice day. The driver will return 0 to the operating system. Bye.\n");
 return 0;
}

