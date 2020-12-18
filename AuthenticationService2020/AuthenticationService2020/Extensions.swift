//
//  Extensions.swift
//  AuthenticationService2020
//
//  Created by Zin Lin Htet Naing on 8/11/20.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func toAttributed(alignment: NSTextAlignment) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return toAttributed(attributes: [.paragraphStyle: paragraphStyle])
    }

    func toAttributed(attributes: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
}
