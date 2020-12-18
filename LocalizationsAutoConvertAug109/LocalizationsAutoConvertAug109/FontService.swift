//
//  FontService.swift
//  LocalizationsAutoConvertAug109
//
//  Created by Zin Lin Htet Naing on 8/1/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    struct CustomFont {
        var fontName: String
        func setMMFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "\(fontName)", size: size)
        }

        func setEngFont(withSize size: CGFloat) -> UIFont? {
            return UIFont(name: "\(fontName)", size: size)
        }
    }

    class var Myanmar3: CustomFont {
        return CustomFont(fontName: "Myanmar3 PaOh")
    }

    class var RobotoMedium: CustomFont {
        return CustomFont(fontName: "Roboto-Medium")
    }


}













//extension UIFont {
//    struct CustomFont {
//
//        var fontFamily: String
//
//        static let defaultFontSize: CGFloat = 12
//
//        func Light(withSize size: CGFloat = CustomFont.defaultFontSize) -> UIFont? {
//            return UIFont(name: "\(fontFamily)", size: size)
//        }
//
//        func Normal(withSize size: CGFloat = CustomFont.defaultFontSize) -> UIFont? {
//            return UIFont(name: "\(fontFamily)", size: size)
//        }
//
//        func Bold(withSize size: CGFloat = CustomFont.defaultFontSize) -> UIFont? {
//            return UIFont(name: "\(fontFamily)", size: size)
//        }
//    }
//    class var Myanmar3: CustomFont {
//        return CustomFont(fontFamily: "Myanmar3 PaOh")
//    }
//
//    class var RobotoMedium: CustomFont {
//        return CustomFont(fontFamily: "Roboto-Medium")
//    }
//}
//
//extension UILabel {
//
//    func substituteFont() {
//
//        var name = font.fontName
//        if !name.lowercased().hasPrefix("avenir") {
//            if name.lowercased().contains("-light") {
//                name = "Avenir-Light"
//            }
//            else if name.lowercased().contains("-semibold") {
//                name = "Avenir-Heavy"
//            }
//            else if  name.lowercased().contains("-bold") {
//                name = "Avenir-Black"
//            }
//            else {
//                name = "Myanmar3 PaOh" // default
//            }
//        }
//        else {
//            return
//        }
//
//        self.font = UIFont(name: name, size: self.font!.pointSize)
//    }
//}
