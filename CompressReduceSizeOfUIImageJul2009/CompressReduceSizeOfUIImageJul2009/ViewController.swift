//
//  ViewController.swift
//  CompressReduceSizeOfUIImageJul2009
//
//  Created by Zin Lin Htet Naing on 7/20/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //large
        guard let compressData = #imageLiteral(resourceName: "IMG.png").jpegData(compressionQuality: 1.0) else { return }
        let myImage = UIImage(data: compressData)

        if let data = myImage?.jpegData(compressionQuality: 1.0) {
            let fileSizeStr = ByteCountFormatter.string(fromByteCount: Int64(data.count), countStyle: ByteCountFormatter.CountStyle.memory)
            print(fileSizeStr)
        }

        //Medium
        guard let compressDataOne = #imageLiteral(resourceName: "IMG.png").jpegData(compressionQuality: 0.5) else { return }
        let myImageOne = UIImage(data: compressDataOne)

        if let data = myImageOne?.jpegData(compressionQuality: 0.5) {
            let fileSizeStr = ByteCountFormatter.string(fromByteCount: Int64(data.count), countStyle: ByteCountFormatter.CountStyle.memory)
            print(fileSizeStr)
        }

        //Small
        guard let compressDataTwo = #imageLiteral(resourceName: "IMG.png").jpegData(compressionQuality: 0) else { return }
        let myImageTwo = UIImage(data: compressDataTwo)

        if let data = myImageTwo?.jpegData(compressionQuality: 0) {
            let fileSizeStr = ByteCountFormatter.string(fromByteCount: Int64(data.count), countStyle: ByteCountFormatter.CountStyle.memory)
            print(fileSizeStr)
        }


    }


}

