//
//  LoginModuleBuilder.swift
//  LoginFeatureUsingViperARCJun2819
//
//  Created by Zin Lin Htet Naing on 6/30/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class LoginModuleBuilder {

    static func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        let interactor = loginInteractor()
        let router = LoginRouter(view: view)
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}



