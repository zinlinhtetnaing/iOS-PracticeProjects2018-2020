//
//  LoginPresenter.swift
//  Attendance
//
//  Created by Zin Lin Htet Naing on 6/27/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocl?
    var router: PresenterToRouterProtocol?
    var interactor: PresentorToInterectorProtocol?

    init(view: PresenterToViewProtocl, interactor: PresentorToInterectorProtocol, router: PresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func started() {
        view?.initialControlSetup()
    }

    func onLoginButtonPressed(email: String, password: String) {
        interactor?.login(email: email, password: password)
    }

    func gotoDashboard() {
        if let from = self.view as? UIViewController {
            self.router?.gotoDashboard(fromVC: from)
        }
    }
}

extension LoginPresenter: InterectorToPresenterProtocol {
    func emailIsEmpty() {
        view?.emptyEmailError()
    }
    
    func emailIsNotFormat() {
        view?.invalidEmailFormatError()
    }
    
    func passwordIsEmpty() {
        view?.emptyPassowrdError()
    }
    
    func loginSuccess(message: String) {
        view?.showSuccess()
        gotoDashboard()
    }
    
    func loginFailed(message: String) {
        view?.showError()
    }
}
