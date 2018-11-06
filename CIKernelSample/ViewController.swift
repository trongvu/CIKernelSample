//
//  ViewController.swift
//  CIImage
//
//  Created by Trong Vu on 11/6/18.
//  Copyright © 2018 Trong Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "testImg")
    }

    @IBAction func applyButtonClicked(_ sender: Any) {
        let filter = MetalFilter()
        filter.inputImage =  CIImage(image: UIImage(named: "testImg")!)
        let outputImage = filter.outputImage()
        imageView.image = convert(cmage: outputImage)
    }
    

    func convert(cmage:CIImage?) -> UIImage?
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage!, from: cmage!.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
}

