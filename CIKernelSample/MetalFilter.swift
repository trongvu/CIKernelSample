//
//  MetalFilter.swift
//  CIImage
//
//  Created by Trong Vu on 11/6/18.
//  Copyright © 2018 Trong Vu. All rights reserved.
//

import Foundation
import CoreImage

class MetalFilter: CIFilter {
    
    private let kernel: CIColorKernel
    
    var inputImage: CIImage?
    
    override init() {
        let url = Bundle.main.url(forResource: "default", withExtension: "metallib")!
        let data = try! Data(contentsOf: url)
        kernel = try! CIColorKernel(functionName: "myColor", fromMetalLibraryData: data)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func outputImage() -> CIImage? {
        guard let inputImage = inputImage else {return nil}
        return kernel.apply(extent: inputImage.extent, arguments: [inputImage])
    }
}
