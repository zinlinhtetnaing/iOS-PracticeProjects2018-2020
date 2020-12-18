//
//  AddCartViewController.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/9/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class AddCartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    
    let code = ["A001","A002"]
    let name = ["A","B"]
    let price = ["100000","100000"]
    let qty = ["2","4"]
    let total = ["200000","400000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCell()
        tableViewSetUp()
        pageTitleSetup()
    }
    
    func registerTableCell(){
        self.cartTableView.register(UINib(nibName: "AddCart", bundle: nil), forCellReuseIdentifier:"cartCell")
    }
    
    func tableViewSetUp(){
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    func pageTitleSetup() {
        self.title = "Cart List"
    }
    
}

extension AddCartViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as!  AddCartTableViewCell
        cell.setData(code: code[indexPath.row], name: name[indexPath.row], price: price[indexPath.row], qty: qty[indexPath.row
            ], total: total[indexPath.row])
    
        return cell
    }
    
}

extension AddCartViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}



