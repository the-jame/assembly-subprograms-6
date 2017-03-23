#include <stdlib.h>
#include <stdio.h>


double sumarray(double *pArray, int number);
void reciprocals(double *pInput, double *pOut, int number);

double harmononicmean(double *pArray, int number){
  double s;
  double *pRec=malloc(number*sizeof(double));
  reciprocals(pArray,pRec,number);
  s=sum(pRec,number);
  s=number/s;
  printf("The harmonic mean of the array is %1.10lf\n",s);
  printf("The array of reciprocals is\n");
  outputdataarray(pRec, number);
  free(pRrec);
  return s;
  
}
