//
//  LargeImageController.swift
//  LBTAComponentsJul1809
//
//  Created by Zin Lin Htet Naing on 7/19/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import UIKit
import LBTAComponents

class LargeImageController: UIViewController {

    var imageName: String?

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        button.addTarget(self, action:#selector(backAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLargeImage()
        loadImage(imageName)
    }

    fileprivate func setUpLargeImage() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(button)
        button.anchor(view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 30)
        DispatchQueue.main.async {
            self.imageView.fillSuperview()
        }
    }

    func loadImage(_ named: String?) {
        guard let named = named else { return }
        imageView.image = UIImage(named: named)
    }

    @objc func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
