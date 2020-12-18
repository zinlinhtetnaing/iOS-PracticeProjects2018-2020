//
//  DashBoardViewController.swift
//  Forward
//
//  Created by Zin Lin Htet Naing on 12/9/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController,UISearchResultsUpdating,UISearchBarDelegate{
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    let items = [("A001","A","1.jpg","AAA","100000","Show A Details"),("B002","B","2.jpg","BBB","100000","Show B Details")]
    
    var currentItems = [(String,String,String,String,String,String)]()
    
    let searchController =  UISearchController(searchResultsController: nil)
    
    var shouldShowSearchResults = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        addLogoutBarButton()
        pageTitleSetup()
        registerTableCell()
        searchBarSetUp()
        hideBackButton()
    }
    
    func registerTableCell(){
        self.itemsTableView.register(UINib(nibName: "Items", bundle: nil), forCellReuseIdentifier:"itemCell")
    }
    
    func tableViewSetUp(){
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
    }
    
    func pageTitleSetup() {
        self.title = "Items"
    }
    
    func hideBackButton(){
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func addLogoutBarButton(){
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonAction(_:)))
        navigationItem.rightBarButtonItem = logoutButton
        logoutButton.tintColor = UIColor.black
    }
    
    @objc func logoutButtonAction(_ sender:UIBarButtonItem){
        dismiss(animated: true, completion: nil)
    }
    
 
    
    func searchBarSetUp(){
        currentItems = items
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Items"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        itemsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        itemsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            itemsTableView.reloadData()
        }
        searchController.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            guard !searchText.isEmpty else {
                currentItems = items
                itemsTableView.reloadData()
                return
            }
            currentItems = items.filter({ outlet -> Bool in
                outlet.1.lowercased().contains(searchText.lowercased())
            })
            itemsTableView.reloadData()
            return
        }
        currentItems = items
    }
    
    
}
extension DashBoardViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults{
            return currentItems.count
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as!  ItemsTableViewCell
        let item = items[indexPath.row]
        if shouldShowSearchResults {
            cell.itemCodeLabel.text = item.0
            cell.itemNameLabel.text = item.1
            cell.itemImageView.image = UIImage(named: item.2)
            cell.itemTypeLabel.text = item.3
            cell.itemPriceLabel.text = item.4
            cell.itemDetailsLabel.text = item.5
            cell.selectionStyle = .none
            
        }
        
        cell.itemCodeLabel.text = item.0
        cell.itemNameLabel.text = item.1
        cell.itemImageView.image = UIImage(named: item.2)
        cell.itemTypeLabel.text = item.3
        cell.itemPriceLabel.text = item.4
        cell.itemDetailsLabel.text = item.5
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        performSegue(withIdentifier: "details", sender:item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! (String,String,String,String,String,String)
        let destVC  = segue.destination as! DetailsViewController
        destVC.itemDetails = item
    }
    
}

extension DashBoardViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
