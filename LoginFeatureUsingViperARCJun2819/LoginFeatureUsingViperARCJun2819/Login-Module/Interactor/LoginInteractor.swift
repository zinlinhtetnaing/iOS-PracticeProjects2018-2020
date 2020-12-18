//
//  LoginInteractor.swift
//  Attendance
//
//  Created by Zin Lin Htet Naing on 6/27/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation

class loginInteractor: PresentorToInterectorProtocol {

    var presenter: InterectorToPresenterProtocol?
    
    func login(email: String, password: String) {
        if validation(email, password) {
            // if validaiton passed, call the api.
            
            //
             presenter?.loginSuccess(message: "Message from the api")
        }
    }

    func isValidEmail(email:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        if emailTest.evaluate(with:email ) {
            return true
        }
        return false
    }

    func validation(_ email: String, _ password: String) -> Bool {
        var ok:Bool = true
        if email.isEmpty {
            presenter?.emailIsEmpty()
            ok = false
        }

        if email.count > 0 {
            if isValidEmail(email: email) == false {
                presenter?.emailIsNotFormat()
                ok = false
                return ok
            }
            ok = true
        }

        if password.isEmpty {
            presenter?.passwordIsEmpty()
            ok = false
        }
        
        return ok
        
    }
}



