//
//  PostTableViewCell.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 4/2/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    weak var post: Post?
    
    func set(post:Post) {
        self.post = post
        
        self.profileImageView.image = nil
        
        ImageService.getImage(withURL: post.author.photoURL) { (image, url) in
            guard let _post = self.post else { return }
            if _post.author.photoURL.absoluteString == url.absoluteString {
                
                self.profileImageView.image = image
                
            }else {
                print("Not the right Image")
            }
            
        }
        
        usernameLabel.text = post.author.username
        postTextLabel.text = post.text
        subtitleLabel.text = post.createAt.calenderTimeSinceNow()
    }
}
