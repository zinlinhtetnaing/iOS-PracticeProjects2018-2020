//
//  ViewController.swift
//  DocumentPickerController
//
//  Created by Zin Lin Htet Naing on 1/2/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,  UIDocumentMenuDelegate, UIDocumentPickerDelegate,UINavigationControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func documentButton(_ sender: UIButton) {
        
        let importMenu = UIDocumentMenuViewController(documentTypes: ["public.image", "public.audio", "public.movie", "public.text", "public.item", "public.content", "public.source-code"], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        
        if let popoverPresentationController = importMenu.popoverPresentationController {
            popoverPresentationController.sourceView = sender
            // popoverPresentationController.sourceRect = sender.bounds
        }
        self.present(importMenu, animated: true, completion: nil)
        
    }
    
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("url = \(url)")
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}

