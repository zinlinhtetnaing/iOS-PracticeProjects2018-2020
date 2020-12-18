//
//  Extensions.swift
//  CustomButtonAug1609
//
//  Created by Zin Lin Htet Naing on 8/16/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

//extension UIView {
//
//    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
//        layer.masksToBounds = false
//        layer.shadowOffset = offset
//        layer.shadowColor = color.cgColor
//        layer.shadowRadius = radius
//        layer.shadowOpacity = opacity
//
//        let backgroundCGColor = backgroundColor?.cgColor
//        backgroundColor = nil
//        layer.backgroundColor =  backgroundCGColor
//    }
//}
//
//
//
//
//
//











//extension CALayer {
//
//    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) -> CAShapeLayer {
//
//        let border = CAShapeLayer()
//
//        switch edge {
//        case UIRectEdge.top:
//            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
//
//        case UIRectEdge.bottom:
//            border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)
//
//        case UIRectEdge.left:
//            border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)
//
//        case UIRectEdge.right:
//            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
//
//        default: do {}
//        }
//
////        border.backgroundColor = UIColor.white.cgColor
////        addSublayer(border)
//        return border
//    }
//}

//extension UIButton {
//    func roundedButton() {
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topRight, .topLeft, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 7, height: 7)).cgPath
//        layer.mask = maskLayer
//        let top = layer.addBorder(edge: .top, color: .white, thickness: 5.0)
//        let right = layer.addBorder(edge: .right, color: .white, thickness: 0.3)
//        let left = layer.addBorder(edge: .left, color: .white, thickness: 1.0)
//        let bottom = layer.addBorder(edge: .bottom, color: .white, thickness: 0.3)
//
//        top.fillColor = UIColor.clear.cgColor
//        left.fillColor = UIColor.clear.cgColor
//        right.fillColor = UIColor.clear.cgColor
//        bottom.fillColor = UIColor.clear.cgColor
//        top.strokeColor = UIColor.white.cgColor
//        left.strokeColor = UIColor.white.cgColor
//        right.strokeColor = UIColor.white.cgColor
//        bottom.strokeColor = UIColor.white.cgColor
//        top.path = maskLayer.path
//        top.lineWidth = 2
//        left.lineWidth = 1
//         right.lineWidth = 3
//         bottom.lineWidth = 9
//        left.path = maskLayer.path
//        right.path = maskLayer.path
//        bottom.path = maskLayer.path
//        top.frame = self.bounds
//        right.frame = self.bounds
//        left.frame = self.bounds
//        bottom.frame = self.bounds
//        self.layer.addSublayer(top)
//        self.layer.addSublayer(right)
//        self.layer.addSublayer(left)
//        self.layer.addSublayer(bottom)
//    }
//
//
//}
//
//

//func set() {

//    // Add rounded corners
//    let maskLayer = CAShapeLayer()
//    maskLayer.frame = buttonFive.bounds
//    //        maskLayer.path = UIBezierPath(roundedRect: buttonFive.bounds, byRoundingCorners: .TopRight | .TopLeft, cornerRadii: CGSize(width: 25, height: 25)).CGPath
//    maskLayer.path = UIBezierPath(roundedRect: buttonFive.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 25, height: 25)).cgPath
//    buttonFive.layer.mask = maskLayer
//
//    // Add border
//    let borderLayer = CAShapeLayer()
//    borderLayer.path = maskLayer.path // Reuse the Bezier path
//    borderLayer.fillColor = UIColor.clear.cgColor
//    borderLayer.strokeColor = UIColor.white.cgColor
//    borderLayer.lineWidth = 4
//    borderLayer.frame = buttonFive.bounds
//    buttonFive.layer.addSublayer(borderLayer)
//}


//
//extension UIButton {
//    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
//        let maskPath1 = UIBezierPath(roundedRect: bounds,
//                                     byRoundingCorners: corners,
//                                     cornerRadii: CGSize(width: radius, height: radius))
//        let maskLayer1 = CAShapeLayer()
//        maskLayer1.frame = bounds
//        maskLayer1.path = maskPath1.cgPath
//        layer.mask = maskLayer1
//    }
//}
//
//
//extension UIButton{
//    // Round specified corners of button
//    func roundBtnCorners(_ corners:UIRectCorner, radius: CGFloat)
//    {
//        let borderLayer = CAShapeLayer()
//        borderLayer.frame = self.layer.bounds
//        borderLayer.strokeColor = UIColor(red: 168/266, green: 20/255, blue: 20/255, alpha: 0.7).cgColor
//        borderLayer.fillColor = UIColor.clear.cgColor
//        borderLayer.lineWidth = 1.0
//        let path = UIBezierPath(roundedRect: self.bounds,
//                                byRoundingCorners: corners,
//                                cornerRadii: CGSize(width: radius, height: radius))
//        borderLayer.path = path.cgPath
//        self.layer.addSublayer(borderLayer)
//    }
//}
//

//extension UIButton {
//    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
//        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = maskPath.cgPath
//        layer.mask = maskLayer
//    }
//}
