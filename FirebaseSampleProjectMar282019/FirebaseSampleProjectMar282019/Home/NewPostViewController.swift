//
//  NewPostViewController.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 4/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleMobileAds

protocol NewPostVCDelegate {
    func didUploadPost(withID id: String)
}

class NewPostViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var placeHolderLabel: UILabel!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var postAndDoneButton: UIButton!
    
    //The banner View
    @IBOutlet weak var adsBannerView: GADBannerView!
    
    var delegate: NewPostVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        postAndDoneButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        postAndDoneButton.layer.cornerRadius = postAndDoneButton.bounds.height / 2
        postAndDoneButton.clipsToBounds = true
        
        textView.delegate = self
        
        presentAdMobBanner()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        //Remove the nav shadow underline
        
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel.isHidden = !textView.text.isEmpty
    }
    
    @IBAction func postAndDoneButtonAction() {
        guard let userProfile = UserService.currentUserProfile else { return }
        // Firebase code here
        
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        let postObject = [
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username,
                "photoURL": userProfile.photoURL.absoluteString
            ],
            "text": textView.text,
            "timestamp": [".sv":"timestamp"]
            ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.delegate?.didUploadPost(withID: ref.key!)
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
            }
        })
    }
    
    @IBAction func handleCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func presentAdMobBanner() {
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        adsBannerView.adUnitID = adMobBannerAdUnitID
        adsBannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID,adMobMyDeviceUUID]
        adsBannerView.load(request)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            super.dismiss(animated: flag, completion: completion)
        }
    }
    
}
