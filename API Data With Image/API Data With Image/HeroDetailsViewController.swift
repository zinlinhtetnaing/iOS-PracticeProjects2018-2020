//
//  HeroDetailsViewController.swift
//  API Data With Image
//
//  Created by Zin Lin Htet Naing on 9/4/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Foundation

class HeroDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legLabel: UILabel!
    
    var hero:HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         
        nameLabel.text = hero?.localized_name
        attributeLabel.text = hero?.primary_attr
        attackLabel.text = hero?.attack_type
        legLabel.text = "\((hero?.legs)!)"
        
        let urlString = "https://api.opendota.com" + (hero?.img)!
        let url = URL(string: urlString)
        
        imageView.downloadFrom(url: url!)
  
    }

}
// image Download From JSON

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
