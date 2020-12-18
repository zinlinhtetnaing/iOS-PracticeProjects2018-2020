//
//  ViewController.swift
//  DeviceIdCheck
//
//  Created by Zin Lin Htet Naing on 7/16/20.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import DeviceCheck

class ViewController: UIViewController {

    @IBOutlet weak var deviceIDLable: UILabel!
    @IBOutlet weak var checkButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func checkAction(_ sender: UIButton) {
        let device = DCDevice.current
        //         check if the device supports the DeviceCheck API
        guard device.isSupported else {
            let alert = UIAlertController(title: "Unsupported device", message: "Please try in a real device instead of simulator", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        device.generateToken { (data, error) in
            if let data = data {
                print(data)
                print(data.base64EncodedString())
                DispatchQueue.main.async {
                    self.deviceIDLable.text = data.base64EncodedString()
                }
            }
            if let error = error {
                print("Generate Token error:")
                print(error.localizedDescription)
            }
        }
    }
}


