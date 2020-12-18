//
//  ViewController.swift
//  RelmDatabaseAug309
//
//  Created by Zin Lin Htet Naing on 8/3/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit
import RealmSwift
import RBSRealmBrowser

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier = "Cell"

    var pickUpLines: Results<PickUpLine>!

    var notificationToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
}

extension ViewController {
    func setUp() {
        tableViewSetUp()
        barButtonAdd()
        realmSetUp()
        getRealmFilePath()
    }
    func getRealmFilePath(){
        let realm = RealmService.shared.realm
        guard let filePath = realm.configuration.fileURL else { return }
        print(filePath)
    }

    func realmSetUp() {
        let realm = RealmService.shared.realm
        pickUpLines = realm.objects(PickUpLine.self)
        notificationToken = realm.observe({ (notification, realm) in
            self.tableView.reloadData()
        })
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error")
        }
    }

    func tableViewSetUp() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }

    func registerCell() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }

    func barButtonAdd() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick(_:)))
        let realmBrowser = UIBarButtonItem(title: "Realm", style: UIBarButtonItemStyle.plain, target: self, action:   #selector(ViewController.openBrowser))
        navigationItem.leftBarButtonItem = realmBrowser
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.tintColor = .white
    }

    @objc func addButtonClick(_ sender: UIBarButtonItem) {
        AlertService.addAlert(in: self) { (line, score, email) in
            let newPickUpLine = PickUpLine(line: line, score: score, email: email)
            RealmService.shared.insert(newPickUpLine)
        }
    }

    @objc func openBrowser() {
        guard let realmBrowser = RBSRealmBrowser.realmBrowser(showing: ["PickUpLine"]) else { return }
        present(realmBrowser, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickUpLines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        let pickUpLine = pickUpLines[indexPath.row]
        cell.configure(with: pickUpLine)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pickUpLine = pickUpLines[indexPath.row]
        AlertService.updateAlert(in: self, pickUpLine: pickUpLine) { (line, score, email) in
            let dict: [String: Any?] = ["line": line,
                                        "score": score,
                                        "email": email]
            RealmService.shared.update(pickUpLine, with: dict)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let pickUpLine = pickUpLines[indexPath.row]
        RealmService.shared.delete(pickUpLine)
    }
}
