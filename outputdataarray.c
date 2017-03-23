#include <stdio.h>



void outputdataarray(double *arr, int num){
  int i;
  for(i=0; i<num;i++){
    printf("%1.10lf\n",*arr);
    arr ++; //  get next element
  }
}
