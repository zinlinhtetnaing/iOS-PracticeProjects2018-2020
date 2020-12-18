//
//  UserProfileDatasourceCell.swift
//  LBTAComponentsJul1809
//
//  Created by Zin Lin Htet Naing on 7/19/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import LBTAComponents

//Mark: - CellClass
class UserProfileDatasourceCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
            guard let image = datasourceItem as? Images else { return }
            imageView.image = UIImage(named: image.imageName)
        }
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override func setupViews() {
        super.setupViews()
        backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        addSubview(imageView)
        imageView.fillSuperview()
    }
}

//Mark: - Header
class UserProfileHeaderDatasourceCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            profileImageView.image = UIImage(named: user.userImageName)
            nameLabel.text = user.userName
            postLabel.text = "\(user.postCount) Posts"
        }
    }

    let profileImageWidth: CGFloat = 60
    let profileImageHeight: CGFloat = 60

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = profileImageWidth / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()

    let postLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()

    override func setupViews() {
        super.setupViews()
        self.addSubViews(profileImageView, nameLabel, postLabel)

        profileImageView.anchor(self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: profileImageWidth, heightConstant: profileImageHeight)

        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 0)

        postLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)
    }
}

//Mark: - Footer
class UserProfileFooterDatasourceCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            copyrightLabel.text = "\(user.userName)© 2019"
        }
    }

    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(copyrightLabel)
        copyrightLabel.fillSuperview()
    }
}


