//
//  AppDelegate.swift
//  AuthenticationService2020
//
//  Created by Zin Lin Htet Naing on 8/11/20.
//  Copyright © 2020 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
//        if let path = Bundle.main.path(forResource: "Key", ofType: "plist") {
//            guard let key = NSDictionary(contentsOfFile: path)?.allKeys.first as? String else { return false}
//            print(key)
            GIDSignIn.sharedInstance()?.clientID = "64241389725-2afe1uvvodd2g3t7c559no9idfbrfcjo.apps.googleusercontent.com"
//        }

        if let infoPlistPath = Bundle.main.url(forResource: "Key", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)

                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    guard let clientID = dict.first?.value as? String else { return false }
                    GIDSignIn.sharedInstance()?.clientID = clientID
                    print(clientID)
                }
            } catch {
                print(error)
            }
        }



        debugPrint("AppDelegate Start")
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        return GIDSignIn.sharedInstance().handle(url)
    }


}
