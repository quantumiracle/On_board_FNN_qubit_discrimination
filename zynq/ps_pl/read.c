///////////////////////////////////////
// Feedforward implementation of qubit2lay.py with C++
//using weights & bias data trained from qubit2lay.py Neural Network
//////////////////////////////////////
#include <math.h>
#include <stdlib.h>

#include <stdio.h>
#include <string.h>

//#include "Timer.h"
#include<time.h>
//#include <sstream>	




//模板函数：将string类型变量转换为常用的数值类型（此方法具有普遍适用性）
//template <class Type>
//Type stringToNum(const string& str)
/*
float stringToNum(const string& str)
{
	istringstream iss(str);
	//Type num;
    float num;
	iss >> num;
	return num;    
}
*/

int main(){


    int last_b=0;
    const int num=10;
    char * b,c[num];
    float d;
    /*
 std::string num = "0.6";
double temp = ::atof(num.c_str());
cout<<temp<<endl;
*/
//set parameters
  char* str1=",-0.25748923,-0.23590721,-0.21906547,0.59941506,-0.2480824,-0.22780496,-0.258952,-0.08409015,0.54508823,-0.28011137,0.16650799,0.59744155,0.53245896,0.6548352,0.15048355,0.5493146,0.57741463,-0.25066608,0.5806574,-0.252708,0.9996286,1.0001718";

//    printf("%s\n",b+3);
//    printf("%ld\n",strlen(b));    
   
//    char dest[4] = {""};
// char src[] = {"123456789"};
// strncpy(c, str1, num-1);
// puts(c);

   
for (int i=0;i<10;i++){
    b=strchr(str1, ',');
    //printf("%s\n",b);
    strncpy(c,b+1,9);
   printf("%s\n",c);
   d=atof(c);
   printf("%f\n",d);
   str1=b+10;
   
   //cout<<str1[i:i+5]<<endl;
   
}
return 1;

}





            
