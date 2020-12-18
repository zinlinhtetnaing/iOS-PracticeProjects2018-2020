//
//  LoginViewController.swift
//  Attendance
//
//  Created by Zin Lin Htet Naing on 6/27/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var rememberPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    var presenter: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.started()       
    }

    func hideErrorLabel(hidden: Bool) {
        emailErrorLabel.isHidden = hidden
        passwordErrorLabel.isHidden = hidden
    }

    func textFieldSetUp(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func emptyTextField(){
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    func textFieldClearButton(){
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            emailTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return false
    }

    @IBAction func rememberPasswordButtonAction(_ sender: UIButton) {

    }

    @IBAction func loginButtonAction(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        presenter?.onLoginButtonPressed(email: email, password: password)
    }

    @IBAction func emailTextField(_ sender: UITextField) {
        emailErrorLabel.isHidden = true
    }

    @IBAction func passwordTextField(_ sender: UITextField) {
        passwordErrorLabel.isHidden = true
    }

}
extension LoginViewController: PresenterToViewProtocl {
    
    func showLoading() {
        print("===> Show Loading")
    }

    func hideLoading() {
        print("===> Hide Loading")
    }

    func showSuccess() {
        print("===> Success Message Show")
    }

    func showError() {
        print("===> Error Message Show")
    }

    func emptyEmailError() {
        UIView.animate(withDuration: 0.3) {
            self.emailErrorLabel.text = "Email is Required!"
            self.emailErrorLabel.isHidden = false
        }
    }

    func invalidEmailFormatError() {
        UIView.animate(withDuration: 0.3) {
            self.emailErrorLabel.text = "Invalid Email Format"
            self.emailErrorLabel.isHidden = false
        }
    }

    func emptyPassowrdError() {
        UIView.animate(withDuration: 0.3) {
            self.passwordErrorLabel.text = "Password is Required!"
            self.passwordErrorLabel.isHidden = false
        }
    }
    
    func initialControlSetup() {
        hideErrorLabel(hidden: true)
        textFieldSetUp()
        textFieldClearButton()
    }

}

