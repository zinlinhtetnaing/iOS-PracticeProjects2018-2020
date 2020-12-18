//
//  LoginRouter.swift
//  Attendance
//
//  Created by Zin Lin Htet Naing on 6/27/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter {

    var viewController: UIViewController
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension LoginRouter: PresenterToRouterProtocol {

    func gotoDashboard(fromVC: UIViewController) {
        if let dashBoardVC = fromVC.storyboard?.instantiateViewController(withIdentifier: "dashboard") {
            fromVC.present(dashBoardVC, animated: true)
        }
    }

}
