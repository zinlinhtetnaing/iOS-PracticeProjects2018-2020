//
//  ViewController.swift
//  LBTAComponentsJul1809
//
//  Created by Zin Lin Htet Naing on 7/18/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import LBTAComponents

class ViewController: UIViewController {

    let profileImageWidth: CGFloat = 60
    let profileImageHeight: CGFloat = 60

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lionKingProfile.jpg"))
        imageView.layer.cornerRadius = profileImageWidth / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lion King"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return label
    }()

    let postLabel: UILabel = {
        let label = UILabel()
        label.text = "120 Posts"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 0.2392156863, blue: 0, alpha: 1)
        return label
    }()

    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "77"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.9568627451, green: 0.3176470588, blue: 0.1176470588, alpha: 1)
        return label
    }()

    let followerLabel: UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2392156863, green: 0.3529411765, blue: 0.9960784314, alpha: 1)
        return label
    }()

    let followingNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "137"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.4039215686, green: 0.2274509804, blue: 0.7176470588, alpha: 1)
        return label
    }()

    let followingLabel: UILabel = {
        let label = UILabel()
        label.text = "Following"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(profileImageView, nameLabel, postLabel, numberLabel, followerLabel, followingNumberLabel, followingLabel)
        constraints()
    }

    private func constraints() {
        profileImageView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: profileImageWidth, heightConstant: profileImageHeight)

        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)

        postLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)

        numberLabel.anchor(profileImageView.topAnchor, left: nameLabel.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 0)

        followerLabel.anchor(numberLabel.bottomAnchor, left: postLabel.rightAnchor , bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)

        followingNumberLabel.anchor(profileImageView.topAnchor, left: numberLabel.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 0)

        followingLabel.anchor(followingNumberLabel.bottomAnchor, left: followerLabel.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)
    }
}

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach { (view) in
            addSubview(view)
        }
    }
}

