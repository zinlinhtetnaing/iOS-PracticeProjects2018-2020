//
//  LoginProtocols.swift
//  Attendance
//
//  Created by Zin Lin Htet Naing on 6/27/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

//Presenter -> View
protocol PresenterToViewProtocl: class {
//    var presenter: ViewToPresenterProtocol? { get set }
    func showLoading()
    func hideLoading()
    func showSuccess()
    func showError()
    func emptyEmailError()
    func invalidEmailFormatError()
    func emptyPassowrdError()    
    func initialControlSetup()
}

//View -> Presenter
protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocl? {get set}
    var interactor: PresentorToInterectorProtocol? {get set}
    func onLoginButtonPressed(email: String, password: String)
    func started()
}

//Interactor -> Presenter
protocol InterectorToPresenterProtocol: class {
    func emailIsEmpty()
    func emailIsNotFormat()
    func passwordIsEmpty()
    func loginFailed(message: String)
    func loginSuccess(message: String)
}

//Presenter -> Interactor
protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func login(email: String, password: String)
}

//Presenter -> Router or WireFrame
protocol PresenterToRouterProtocol: class {
    func gotoDashboard(fromVC: UIViewController)
}

