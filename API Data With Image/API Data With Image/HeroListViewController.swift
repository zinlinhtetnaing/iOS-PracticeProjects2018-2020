//
//  ViewController.swift
//  API Data With Image
//
//  Created by Zin Lin Htet Naing on 9/4/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class HeroListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var heros = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downLoadJSON {
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default, reuseIdentifier: nil)
        cell.textLabel?.text = heros[indexPath.row].localized_name.capitalized
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroDetailsViewController {
            destination.hero = heros[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func downLoadJSON(completed:@escaping()->()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            if error == nil {
                do{
                    self.heros = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch{
                    print("JSON Error")
                }
            }
        }.resume()
    }
    
    
}

