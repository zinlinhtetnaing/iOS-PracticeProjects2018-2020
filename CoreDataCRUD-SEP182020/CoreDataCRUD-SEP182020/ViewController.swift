//
//  ViewController.swift
//  CoreDataCRUD-SEP182020
//
//  Created by Zin Lin Htet Naing on 18/09/2020.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Data for the table
    var items: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchPeople()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func fetchPeople() {
        // Fetch the data from Core Data to Display in the tableview
        do {
            self.items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    
    }

    @IBAction func addButonAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add", message: "What is your name", preferredStyle: .alert)
        alert.addTextField()
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            let textField = alert.textFields?[0]
            //TODO: Create a person Object
            let newPerson = Person(context: self.context)
            newPerson.name = textField?.text
            newPerson.age = 20
            newPerson.gender = "Female"
            
            //TODO: Dave the Data
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            //TODO: Re-Fetch the Data
            self.fetchPeople()
        }
        alert.addAction(saveButton)
        self.present(alert, animated: true)
    }
    
    @IBAction func deleteButtonAction(_ sender: UIBarButtonItem) {
        //TODO: Remove the Person Object
        deleteAll()
        //TODO: ReFetch the Data
        self.fetchPeople()
        
    }
    
    func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.persistentStoreCoordinator?.execute(deleteRequest, with: context)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    //MARK: - CoreData File Path
//    func getSqliteTo(destinationPath: String, persistentContainer: NSPersistentContainer) {
//        let storeUrl = persistentContainer.persistentStoreCoordinator.persistentStores.first?.url
//
//        let sqliteFileName = storeUrl!.lastPathComponent
//        let walFileName = sqliteFileName + "-wal"
//        let shmFileName = sqliteFileName + "-shm"
//        //Add all file names in array
//        let fileArray = [sqliteFileName, walFileName, shmFileName]
//
//        let storeDir = storeUrl!.deletingLastPathComponent()
//
//        // Destination dir url, make sure file don't exists in that folder
//        let destDir = URL(fileURLWithPath: destinationPath, isDirectory: true)
//
//        do {
//            for fileName in fileArray {
//                let sourceUrl = storeDir.appendingPathComponent(fileName, isDirectory: false)
//                let destUrl = destDir.appendingPathComponent(fileName, isDirectory: false)
//                try FileManager.default.copyItem(at: sourceUrl, to: destUrl)
//                print("File: \(fileName) copied to path: \(destUrl.path)")
//            }
//        }
//        catch {
//            print("\(error)")
//        }
//        print("\n\n\n ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ NOTE ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n")
//        print("In your terminal run the following commands to merge wal file. Otherwise you may see partial or no data in \(sqliteFileName) file")
//        print("\n-------------------------------------------------")
//        print("$ cd \(destDir.path)")
//        print("$ sqlite3 \(sqliteFileName)")
//        print("sqlite> PRAGMA wal_checkpoint;")
//        print("-------------------------------------------------\n")
//        print("Press control + d")
//    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = self.items![indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            //TODO: Which Person to Remove
            let personToRemove = self.items![indexPath.row]
            
            //TODO: Remove the Person
            self.context.delete(personToRemove)
            
            //TODO: Save the Data
            do {
                try self.context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            //TODO: ReFetch the Data
            self.fetchPeople()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            //TODO: Selected Person
            let person = self.items![indexPath.row]
            
            //TODO: Create Alert
            let alert = UIAlertController(title: "Edit", message: "Update Your Name", preferredStyle: .alert)
            alert.addTextField()
            let textField = alert.textFields![0]
            textField.text = person.name
            let updateButton = UIAlertAction(title: "Update", style: .default) { (action ) in
                //TODO: Get the textfield for the alert
                let textField = alert.textFields![0]
                
                //TODO: Edit name property of person Object
                person.name = textField.text
                
                //TODO: Save the Data
                do {
                    try self.context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
                //TODO: ReFetch the Data
                self.fetchPeople()
            }
            alert.addAction(updateButton)
            self.present(alert, animated: true)
        }
        
        editAction.backgroundColor = .orange
        return UISwipeActionsConfiguration(actions: [editAction])
    }
}
