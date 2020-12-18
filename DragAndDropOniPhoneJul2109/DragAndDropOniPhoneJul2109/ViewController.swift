//
//  ViewController.swift
//  DragAndDropOniPhoneJul2109
//
//  Created by Zin Lin Htet Naing on 7/21/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!

    var tableViewData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.textDragDelegate = self
        tableView.dropDelegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITextDragDelegate, UITableViewDropDelegate {

    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, dragPreviewForLiftingItem item: UIDragItem, session: UIDragSession) -> UITargetedDragPreview? {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "drag"))
        imageView.backgroundColor = .clear

        let dragView = textDraggableView
        let dragPoint = session.location(in: dragView)
        let target = UIDragPreviewTarget(container: dragView, center: dragPoint)

        return UITargetedDragPreview(view: imageView, parameters: UIDragPreviewParameters(), target: target)

    }

    func textDraggableView(_ textDraggableView: UIView & UITextDraggable, itemsForDrag dragRequest: UITextDragRequest) -> [UIDragItem] {
        if let string = textView.text(in: dragRequest.dragRange) {
            print(string)
            let itemProvider = NSItemProvider(object: string as NSString)
            return [UIDragItem(itemProvider: itemProvider)]
        }else {
            return []
        }
    }

    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destIndexPath = indexPath
        }else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destIndexPath = IndexPath(row: row, section: section)
        }

        coordinator.session.loadObjects(ofClass: NSString.self) { (items) in
            guard let stringArray = items as? [String] else { return }
            self.tableViewData.insert(stringArray.first!, at: destIndexPath.row)
            tableView.insertRows(at: [destIndexPath], with: .automatic)
        }
        
    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let stringObject = tableViewData[indexPath.row]
        cell.textLabel?.text = stringObject
        return cell
    }
}

