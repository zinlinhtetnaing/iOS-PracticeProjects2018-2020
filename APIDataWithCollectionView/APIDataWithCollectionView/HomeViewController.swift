//
//  ViewController.swift
//  APIDataWithCollectionView
//
//  Created by Zin Lin Htet Naing on 9/4/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

struct Hero:Decodable {
    let localized_name:String
    let img:String
}

class HomeViewController: UIViewController,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var heros = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDownload()
        forCollectionView()
        
    }
    func forCollectionView(){
        collectionView.dataSource = self
    }
    
    // Json Data Download
    func jsonDownload(){
        let url    = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil{
                do{
        self.heros = try JSONDecoder().decode([Hero].self, from: data!)
                }
                catch{
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        .resume()
    }
    
    // collectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as!  CustomCollectionViewCell
        
        // For name from json
        cell.nameLabel.text = heros[indexPath.row].localized_name.capitalized
        
        // For image from json
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heros[indexPath.row].img
        cell.imageView.downloadedFrom(link: completeLink)
        
        //imageView rounded
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        cell.imageView.contentMode = .scaleAspectFill
        
        return cell
    }
    
    
}

// imageDownload from Json
extension UIImageView {
    func downloadFrom(url:URL,contenMode mode:UIViewContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data,response,error in
            guard
                let httpURLResponse = response as? HTTPURLResponse,httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType , mimeType.hasPrefix("image"),
                let data = data,error == nil,
                let image = UIImage(data: data)
                else{return}
            DispatchQueue.main.async {
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link:String,contentMode mode:UIViewContentMode = .scaleAspectFill){
        guard let url = URL(string: link) else {return}
        downloadFrom(url: url,contenMode: mode)
    }
    
}

