//
//  UserProfile.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 4/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation

class UserProfile {
    var uid: String
    var username: String
    var photoURL: URL
    
    init(uid: String, username: String, photoURL: URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}
