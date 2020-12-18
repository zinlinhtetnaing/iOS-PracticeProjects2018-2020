//
//  ViewController.swift
//  SqliteLocalDatabaseMay2219
//
//  Created by Zin Lin Htet Naing on 5/22/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tableview: UITableView!
    
    var database: Connection!

    
    let productsTable = Table("products")
    let id = Expression<Int>("id")
    let brand = Expression<String>("brand")
    let model = Expression<String>("model")
    
    let cell = "cell"
    
    var modelsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("Products").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)
            print(database)
            self.database = database
        }catch {
            print("error")
        }
        tableViewSetUp()
        tableview.isHidden = true
        listData {
            self.tableview.reloadData()
        }
    }
    
    func tableViewSetUp() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    @IBAction func listData(_ sender: UIButton) {
        print("List Data")
        tableview.isHidden = false
    }
    
    @IBAction func createTable(_ sender: UIButton) {
        print("Create Table")
        createTable()
    }
    
    @IBAction func insertData(_ sender: UIButton) {
        print("Insert Data")
        insertData()
    }
    
    @IBAction func updateData(_ sender: UIButton) {
        print("Update Data")
        updateData()
    }
    
    @IBAction func deleteData(_ sender: UIButton) {
        print("Delete Data")
        deleteData()
    }
    
    @IBAction func hideLists(_ sender: UIButton) {
        tableview.isHidden = true
    }
    
    
    //MARK: - Create Table
    func createTable() {
        let createTable = self.productsTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.brand)
            table.column(self.model)
        }
        do {
            try self.database.run(createTable)
            print("Create Table Success")
        }catch {
            print("Create Table Fail")
        }
    }
    //MARK: - Read Data
    func listData(completion: @escaping()->()) {
        do {
            let products = try self.database.prepare(self.productsTable)
            for product in products {
                modelsArray.append(product[self.model])
                print("ProductID: \(product[self.id]), Brand: \(product[self.brand]), Model: \(product[self.model])")
            }
        }catch {
            print("error")
        }
        completion()
    }
    
    //MARK: Insert Data
    func insertData() {
        let alert = UIAlertController(title: "Insert Now", message: "Do You Want to Insert", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Brand"
            textField.textColor = UIColor.blue
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Model"
            textField.textColor = UIColor.red
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let brand = alert.textFields?.first?.text,
                let model = alert.textFields?.last?.text else { return }
            print(brand)
            print(model)
            
            let insertProduct = self.productsTable.insert(self.brand <- brand, self.model <- model)
            do {
                try self.database.run(insertProduct)
                print("Success Insert")
                self.modelsArray.removeAll()
                self.listData {
                    self.tableview.reloadData()
                }
               
            }catch {
                print("Insert Fail")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Update Data
    func updateData() {
        let alert = UIAlertController(title: "Update Now", message: "Do You Want to Update", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Product Id"
            textField.textColor = UIColor.blue
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Model"
            textField.textColor = UIColor.red
        }
        
        let action = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let productIdString = alert.textFields?.first?.text,
                let productId = Int(productIdString),
                let model = alert.textFields?.last?.text else { return }
            print(productId)
            print(model)
            
            let product = self.productsTable.filter(self.id == productId)
            let updateProduct = product.update(self.model <- model)
            do {
                try self.database.run(updateProduct)
                print("Success Update")
                self.modelsArray.removeAll()
                self.listData {
                    self.tableview.reloadData()
                }
            }catch {
                print("Update Fail")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Delete Data
    func deleteData() {
        let alert = UIAlertController(title: "Delete Now", message: "Do You Want to Delte", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Product Id"
            textField.textColor = UIColor.blue
        }
        let action = UIAlertAction(title: "Delete", style: .default) { (_) in
            guard let productIdString = alert.textFields?.first?.text,
                let productId = Int(productIdString) else { return }
            print(productId)
            
            let product = self.productsTable.filter(self.id == productId)
            let deleteUser = product.delete()
            do {
                try self.database.run(deleteUser)
                print("Delete Success")
                self.modelsArray.removeAll()
                self.listData {
                    self.tableview.reloadData()
                }
                
            } catch {
                print("Delete Fail")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = modelsArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Marker Felt", size: 20.0)
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 41/255, green: 98/255, blue: 255/255, alpha: 1)
        return cell
    }
    
    
    
    
    
}

