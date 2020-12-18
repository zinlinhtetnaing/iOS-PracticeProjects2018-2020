//
//  Models.swift
//  LBTAComponentsJul1809
//
//  Created by Zin Lin Htet Naing on 7/19/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation

//Mark: - Images
struct Images {
    let imageName: String
    init(imageName: String) {
        self.imageName = imageName
    }
}

//Mark: - User
struct User {
    let userName: String
    let userImageName: String
    let postCount: Int

    init(userName: String, userImageName: String, postCount: Int) {
        self.userName = userName
        self.userImageName = userImageName
        self.postCount = postCount
    }
}
