//
//  PickUpLine.swift
//  RelmDatabaseAug309
//
//  Created by Zin Lin Htet Naing on 8/4/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class PickUpLine: Object {
    dynamic var line: String = ""
    let score = RealmOptional<Int>()
    dynamic var email: String? = ""

    convenience init(line: String, score: Int?, email: String?) {
        self.init()
        self.line = line
        self.score.value = score
        self.email = email
    }

    func scoreString() -> String? {
        guard let score = score.value else { return nil }
        return String(score)
    }
}
