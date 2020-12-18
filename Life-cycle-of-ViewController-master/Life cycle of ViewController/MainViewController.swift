//
//  ViewController.swift
//  Life cycle of ViewController
//
//  Created by Михаил Медведев on 27/04/2019.
//  Copyright © 2019 Mikhail Medvedev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainVCIndicators: [UIView]!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var historyCountLabel: UILabel!
    
    //works when change screen orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        //check for the selected ViewController to Avoid Crash
        guard self == tabBarController?.selectedViewController else { return }
        collectHistory(function: #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectHistory(function: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectHistory(function: #function)
    }
    
    // worked between viewWillAppear/viewDidAppear and  viewDidDisappear/viewWillDisappear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectHistory(function: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectHistory(function: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        collectHistory(function: #function)
    }
    
    // both worked between viewWillAppear(_:)  и viewDidAppear(_:) when change screen orientation or calls splitView
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectHistory(function: #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectHistory(function: #function)
        logTextView.scrollRangeToVisible(NSMakeRange(0, -1))
    }
    
    private func collectHistory(function: String = #function) {
        
        let tabBar = tabBarController as! CustomTabBarController
        tabBar.history.append("💡 \(title ?? "nil"): \(function) worked")
        logTextView.text = tabBar.history.joined(separator: "\n")
        
        historyCountLabel.text = "📈 History (contains \(tabBar.history.count) lines):"
        
        //Turn On Indicators
        switch function {
        case "viewDidLoad()":
            mainVCIndicators[0].backgroundColor = .green
        case "viewWillAppear(_:)":
            mainVCIndicators[1].backgroundColor = .green
        case "viewDidAppear(_:)":
            mainVCIndicators[2].backgroundColor = .green
        case "viewWillDisappear(_:)":
            mainVCIndicators[3].backgroundColor = .green
        case "viewDidDisappear(_:)":
            mainVCIndicators[4].backgroundColor = .green
        case "viewWillLayoutSubviews()":
            mainVCIndicators[5].backgroundColor = .green
        case "viewDidLayoutSubviews()":
            mainVCIndicators[6].backgroundColor = .green
        case "viewWillTransition(to:with:)":
            mainVCIndicators[7].backgroundColor = .green
        default:
            break
        }
    }
    
}
