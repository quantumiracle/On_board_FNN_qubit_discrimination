#include "ap_int.h"

float relu(float x);

#pragma SDS data mem_attribute(input:PHYSICAL_CONTIGUOUS,weights:PHYSICAL_CONTIGUOUS,bias:PHYSICAL_CONTIGUOUS,output:PHYSICAL_CONTIGUOUS)
#pragma SDS data access_pattern(input:SEQUENTIAL,weights:SEQUENTIAL,bias:SEQUENTIAL,output:SEQUENTIAL)
#pragma SDS data zero_copy(input,weights,bias,output)
void fcl_1(const int input[10],
		const float weights[10*20],
		const float bias[20],
		float output[20]
		);
#pragma SDS data mem_attribute(input:PHYSICAL_CONTIGUOUS,weights:PHYSICAL_CONTIGUOUS,bias:PHYSICAL_CONTIGUOUS,output:PHYSICAL_CONTIGUOUS)
#pragma SDS data access_pattern(input:SEQUENTIAL,weights:SEQUENTIAL,bias:SEQUENTIAL,output:SEQUENTIAL)
#pragma SDS data zero_copy(input,weights,bias,output)
////#pragma SDS data copy(weights[0:kernel_size],bias[0:bias_size])
void fcl_2(const float input[20],
		const float weights[20*2],
		const float bias[2],
		float output[2]
		);
