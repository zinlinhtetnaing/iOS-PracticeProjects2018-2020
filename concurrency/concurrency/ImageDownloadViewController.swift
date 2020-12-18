//
//  ImageDownloadViewController.swift
//  concurrency
//
//  Created by Zin Lin Htet Naing on 6/30/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ImageDownloadViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    
    @IBAction func downloadButton(_ sender: UIButton) {
        
      
        
    }
    
    
    var imageViews = [UIImageView]()   // empty array

    override func viewDidLoad() {
        super.viewDidLoad()
        imageViews = [imageView1,imageView2,imageView3,imageView4,imageView5,imageView6]
        let urls = ["https://i.pinimg.com/564x/d1/2d/73/d12d73989888d8433d7ccc1693176f78.jpg",
                    "https://i.pinimg.com/564x/ec/95/2f/ec952f465a5aa5f8bbb4529186fb87b9.jpg",
                    "https://i.pinimg.com/564x/cc/b9/8d/ccb98d4d819664e0cc2dd2cb1b94923e.jpg",
                    "https://i.pinimg.com/564x/a5/23/bc/a523bc31a62963ed9fefd5816c67c575.jpg",
                    "https://i.pinimg.com/564x/a4/73/9c/a4739c6a4eb2076c292ab0b8366a6ef9.jpg",
                    "https://i.pinimg.com/564x/99/4f/be/994fbe84ccf660dae776fac959796887.jpg"
                    ]
        
        for i in 0 ..< imageViews.count{
            downloadImage(urls[i], imageViews[i])
        }

    }

    func downloadImage(_ urlString:String , _ imageView:UIImageView){
        
        let imgurl = URL(string: urlString)!
        let request = URLRequest(url:imgurl)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request){(data,response,error)in
            
            
            print(response?.mimeType)
            
            if error == nil && data != nil{
                let image = UIImage(data: data!)
                imageView.image = image   // UI Related task , move to main thread
                
            }
            
            
        }
        
        task.resume() // initiate
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    

}
