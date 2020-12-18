//
//  ContactsController.swift
//  PassDataBackToPreviousVCJun1619
//
//  Created by Zin Lin Htet Naing on 6/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Contact {
    var fullName: String
}

class ContactsController: UITableViewController {
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Contacts"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: - Selectors
    @objc func handleAddContact() {
        let controller = AddContactController()
        controller.delegate = self
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    //MARK: - UITableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullName
        return cell
    }
}

extension ContactsController: AddContactDelegate {
    func addContact(contact: Contact) {
        self.dismiss(animated: true) {
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
}

