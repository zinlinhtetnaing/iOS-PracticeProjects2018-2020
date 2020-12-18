//
//  AddContactController.swift
//  PassDataBackToPreviousVCJun1619
//
//  Created by Zin Lin Htet Naing on 6/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

protocol AddContactDelegate {
    func addContact(contact: Contact)
}

class AddContactController: UIViewController {
    
    var delegate: AddContactDelegate?
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        view.addSubview(textField)
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
    }
    
    //MARK: - Selectors
    @objc func handleDone() {
        guard let fullName = textField.text, textField.hasText else {
            print("Handle error here..")
            return
        }
        let contact = Contact(fullName: fullName)
        print(contact.fullName)
        delegate?.addContact(contact: contact)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
