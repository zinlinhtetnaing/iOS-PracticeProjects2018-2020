//
//  GoogleSigninClient.swift
//  AuthenticationService2020
//
//  Created by Zin Lin Htet Naing on 8/12/20.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import GoogleSignIn

class GoogleSigninClient: NSObject {

    var completionHandler: ((_ fullname: String?, _ email: String?, _ token: String?) -> Void)!
    
    @objc func login(block: @escaping (_ fullname: String?, _ email: String?, _ token: String?) -> Void) {
        self.completionHandler = block
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.signIn()
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

    @objc func logout() {
        GIDSignIn.sharedInstance()?.signOut()
    }
}

extension GoogleSigninClient: GIDSignInDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let email = user.profile.email
        //        let givenName = user.profile.givenName
        //        let familyName = user.profile.familyName
        //        let userId = user.userID
        completionHandler(fullName, email, idToken)
    }
}
