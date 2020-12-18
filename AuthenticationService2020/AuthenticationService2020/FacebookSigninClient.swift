//
//  FacebookSigninClient.swift
//  
//
//  Created by Zin Lin Htet Naing on 8/27/20.
//

import Foundation
import FBSDKLoginKit

class FacebookSigninClient: NSObject {

    var completionHandler: ((_ fullname: String?, _ email: String?, _ token: String?) -> Void)?

    

}

extension FacebookSigninClient: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }

    @objc func login(block: @escaping (_ fullname: String?, _ email: String?, _ token: String?) -> Void) {

    }
}
