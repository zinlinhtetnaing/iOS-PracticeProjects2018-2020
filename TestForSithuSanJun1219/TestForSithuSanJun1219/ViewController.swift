//
//  ViewController.swift
//  TestForSithuSanJun1219
//
//  Created by Zin Lin Htet Naing on 6/12/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import Foundation

//final class Check: Codable {
//    var check: Int
//    init(check: Int) {
//        self.check = check
//    }
//}
//
//enum APIError: Error {
//    case responseProblem
//    case decodingProblem
//    case encodingProblem
//}
//
//struct APIRequest {
//    let resourceURL:  URL
//    init(email: String, password: String) {
//        let resourceString = "http://myanway.com/delivery/public/api/login?email=\(email)&password=\(password)"
//        guard let resourceURL = URL(string: resourceString) else { fatalError() }
//        self.resourceURL = resourceURL
//    }
//
//    func save(checkToSave: Check, completion: @escaping(Result<Check, APIError>) -> Void) {
//        do {
//            var urlRequest = URLRequest(url: resourceURL)
//            urlRequest.httpMethod = "POST"
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpBody = try JSONEncoder().encode(checkToSave)
//
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, _) in
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                    let jsonData  = data else {
//                        completion(.failure(.responseProblem))
//                        return
//                }
//
//                do {
//                    let checkData = try JSONDecoder().decode(Check.self, from: jsonData)
//                    completion(.success(checkData))
//                }catch {
//                    completion(.failure(.decodingProblem))
//                }
//            }
//            dataTask.resume()
//        }catch {
//            completion(.failure(.encodingProblem))
//        }
//    }
//}

struct Check: Codable {
    let check: Int
}

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        postLoginRequest()
    }
    
    func postLoginRequest() {
        
        let parameters = ["email": emailTextField.text, "password": passwordTextField.text]
        
        guard let url = URL(string: "http://myanway.com/delivery/public/api/login") else { return}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("------->\(json)")
                    
                    let decoder = JSONDecoder()
                    let check = try decoder.decode(Check.self, from: data)
                    print(check.check)
                    
                    if check.check == 1 {
                        DispatchQueue.main.async {
                            self.resultLabel.isHidden = false
                            self.resultLabel.text = "Success"
                        }
                        return
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        self.resultLabel.isHidden = false
                        self.resultLabel.text = "Fail"
                    }
                    print(error)
                }
            }
        }.resume()
    }
        
        
       
}

