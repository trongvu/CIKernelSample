

//
//  kernel.metal
//  CIImage
//
//  Created by Trong Vu on 11/6/18.
//  Copyright © 2018 Trong Vu. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;
#include <CoreImage/CoreImage.h> // includes CIKernelMetalLib.h

extern "C" { namespace coreimage {
    
    float4 myColor(sample_t s) {
        return s.grba;
    }
}}
