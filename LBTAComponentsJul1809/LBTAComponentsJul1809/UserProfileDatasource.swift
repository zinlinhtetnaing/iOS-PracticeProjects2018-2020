//
//  UserProfileDatasource.swift
//  LBTAComponentsJul1809
//
//  Created by Zin Lin Htet Naing on 7/19/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import Foundation
import LBTAComponents

//Mark: - Datasource
class UserProfileDatasource: Datasource {

    var images = [Images]()
    var user: User?

    override func numberOfItems(_ section: Int) -> Int {
        return images.count
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        return images[indexPath.item]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserProfileDatasourceCell.self]
    }

    func fetchUserImages(in collectionViewController: DatasourceController) {
        for i in 1...16 {
            let image = Images(imageName: "IMG\(i)")
            images.append(image)
        }
        fetchCurrentUser()
        collectionViewController.collectionView.reloadData()
    }

    fileprivate func fetchCurrentUser() {
        let user = User(userName: "Zin Lin Htet Naing", userImageName: "lionKingProfile", postCount: images.count)
        self.user = user
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserProfileHeaderDatasourceCell.self]
    }

    override func headerItem(_ section: Int) -> Any? {
        return user
    }

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserProfileFooterDatasourceCell.self]
    }

    override func footerItem(_ section: Int) -> Any? {
        return user
    }

}

