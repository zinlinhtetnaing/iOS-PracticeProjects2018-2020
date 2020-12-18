//
//  ViewController.swift
//  AuthenticationService2020
//
//  Created by Zin Lin Htet Naing on 8/11/20.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import AuthenticationServices
import FBSDKLoginKit
import GoogleSignIn


class LoginViewController: UIViewController {

    lazy var titeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Authentications"
        label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()

    lazy var signinWithAppleButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton()
        button.cornerRadius = .pi
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(handleSigninWithApple), for: .touchUpInside)
        return button
    }()

    lazy var signinWithFacebookButton: FBLoginButton = {
        let button = FBLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSigninWithFacebook), for: .touchUpInside)
        return button
    }()

    lazy var signinWithGoogleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .wide
        button.addTarget(self, action: #selector(handleSigninWithGoogle), for: .touchUpInside)
        return button
    }()

    let appleProvider = AppleSignInClient()
    let googleProvider = GoogleSigninClient()
//    let facebookProvider = Facebo

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        setup()
    }

}

// MARK: - Build UI
extension LoginViewController {

    private func setup() {
        addTitleLabel()
        addStackView()
    }

    private func addTitleLabel() {
        self.view.addSubview(titeLabel)
        titeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
    }

    private func addStackView() {
        buttonStackView.addArrangedSubview(signinWithAppleButton)
        buttonStackView.addArrangedSubview(signinWithFacebookButton)
        buttonStackView.addArrangedSubview(signinWithGoogleButton)
        self.view.addSubview(buttonStackView)
        buttonStackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonStackView.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }

}

//MARK: - SigninWithApple
extension LoginViewController {

    @objc func handleSigninWithApple() {
        debugPrint("Signin With Apple")
        appleProvider.handleAppleIdRequest { (fullname, email, token) in
            guard let name = fullname, let email = email, let token = token else { return }
            self.titeLabel.text = email
            debugPrint(name)
            debugPrint(email)
            debugPrint(token)
        }
    }
}

extension LoginViewController{
    @objc func handleSigninWithGoogle() {
        debugPrint("SignIn with Google")
        googleProvider.login { (fullname, email, token) in
            guard let name = fullname, let email = email, let token = token else { return }
            debugPrint(name)
            debugPrint(email)
            debugPrint(token)
        }
    }
}

extension LoginViewController {
    @objc func handleSigninWithFacebook() {

    }
}

