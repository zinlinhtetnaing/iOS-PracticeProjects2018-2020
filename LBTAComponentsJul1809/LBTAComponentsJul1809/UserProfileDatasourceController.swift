//
//  UserProfileDatasourceController.swift
//  
//
//  Created by Zin Lin Htet Naing on 7/19/19.
//

import Foundation
import LBTAComponents

//Mark: - DatasourceController
class UserProfileDatasourceController: DatasourceController {

    let userProfileDatasource = UserProfileDatasource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        self.title = "Instagram"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        self.datasource = userProfileDatasource
        userProfileDatasource.fetchUserImages(in: self)
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width + 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let largeImageController = LargeImageController()
        largeImageController.imageName = userProfileDatasource.images[indexPath.row].imageName
        navigationController?.present(largeImageController, animated: true)
        modalPresentationStyle = .pageSheet
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 16 + 60 + 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 20)
    }
}

