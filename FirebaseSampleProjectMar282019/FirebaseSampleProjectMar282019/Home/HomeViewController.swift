//
//  HomeViewController.swift
//  FirebaseSampleProjectMar282019
//
//  Created by Zin Lin Htet Naing on 3/28/19.
//  Copyright © 2019 Zin Lin Htet Naing. All rights reserved.


import Foundation
import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var posts = [Post]()
    var fetchingMore = false
    var endReached = false
    var cellHeights: [IndexPath: CGFloat] = [:]
    
    let leadingScreenForBatching: CGFloat = 3.0
    
    var refreshControl: UIRefreshControl!
    
    var seeNewPostsButton: SeeNewPostsButton!
    var seeNewPostsButtonTopAnchor: NSLayoutConstraint!
    
    var lastUploadedPostID: String?
    
    var postRef: DatabaseReference {
        
        return Database.database().reference().child("posts")
        
    }
    
    var oldPostsQuery: DatabaseQuery {
        
        var queryRef:DatabaseQuery
        let lastPost = self.posts.last
        if lastPost != nil {
            let lastTimestamp = lastPost!.createAt.timeIntervalSince1970 * 1000
            queryRef = postRef.queryOrdered(byChild: "timestamp").queryEnding(atValue: lastTimestamp)
        }else {
            // ** order with time **
            queryRef = postRef.queryOrdered(byChild: "timestamp")
        }
        return queryRef
        
    }
    
    var newPostsQuery: DatabaseQuery {
        
        var queryRef:DatabaseQuery
        let firstPost = self.posts.first
        if firstPost != nil {
            let firstTimestamp = firstPost!.createAt.timeIntervalSince1970 * 1000
            queryRef = postRef.queryOrdered(byChild: "timestamp").queryStarting(atValue: firstTimestamp)
        }else {
            // ** order with time **
            queryRef = postRef.queryOrdered(byChild: "timestamp")
        }
        return queryRef
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        let cellNib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "postCell")
        
        tableView.register(LoadingCell.self, forCellReuseIdentifier: "loadingCell")
        
        view.addSubview(tableView)
        
        var layoutGuide: UILayoutGuide!
  
        if #available(iOS 11.0, *) {
            layoutGuide = self.view.safeAreaLayoutGuide
        } else {
            //Fallback on earlier versions
            layoutGuide = self.view.layoutMarginsGuide
        }
        
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 120.0).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        tableView.separatorColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        tableView.reloadData()
        
        refreshControl = UIRefreshControl()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        }
        else {
            //Fallback on earlier versions
            tableView.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        seeNewPostsButton = SeeNewPostsButton()
        view.addSubview(seeNewPostsButton)
        seeNewPostsButton.translatesAutoresizingMaskIntoConstraints = false
        seeNewPostsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        seeNewPostsButtonTopAnchor = seeNewPostsButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: -44)
        seeNewPostsButtonTopAnchor.isActive = true
        seeNewPostsButton.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        seeNewPostsButton.widthAnchor.constraint(equalToConstant: seeNewPostsButton.button.bounds.width).isActive = true
        
        seeNewPostsButton.button.addTarget(self, action: #selector(handleRefresh), for: .touchUpInside)
        
        beginBatchFetch()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        listenForNewPosts()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopListeningForNewPosts()
    }
    
    func toggleSeeNewPostsButton(hidden: Bool) {
        if hidden {
            //hide it
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.seeNewPostsButtonTopAnchor.constant = -44.0
                self.view.layoutIfNeeded()
            }, completion: nil)
        }else {
            //show it
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.seeNewPostsButtonTopAnchor.constant = 12
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc func handleRefresh() {
        print("------------ Refresh New Posts -----------------")
        
        toggleSeeNewPostsButton(hidden: true)
        
        newPostsQuery.queryLimited(toFirst: 20).observeSingleEvent(of: .value, with: { snapshot in
            
            var tempPosts = [Post]()
            let firstPost = self.posts.first
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let data = childSnapshot.value as? [String : Any],
                    let post = Post.parse(childSnapshot.key, data),
                    childSnapshot.key != firstPost?.id {
                    
                    tempPosts.insert(post, at: 0)
                    //tempPosts.append(post)
                }
            }
            self.posts.insert(contentsOf: tempPosts, at: 0)
            
            let newIndexPaths = (0..<tempPosts.count).map { i in
                return IndexPath(row: i, section: 0)
            }
            self.refreshControl.endRefreshing()
            self.tableView.insertRows(at: newIndexPaths, with: .top)
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            
            self.listenForNewPosts()
        })
    }
    
    func fetchPosts(completion: @escaping(_ posts:[Post])->()) {
    
//      let queryRef = postRef.queryLimited(toLast: 20)
        oldPostsQuery.queryLimited(toLast: 20).observeSingleEvent(of: .value, with: { snapshot in
            
            var tempPosts = [Post]()
            let lastPost = self.posts.last
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let data = childSnapshot.value as? [String : Any],
                    let post = Post.parse(childSnapshot.key, data),
                    childSnapshot.key != lastPost?.id {
                    
                    tempPosts.insert(post, at: 0)
                    //tempPosts.append(post)
                }
            }
            
            return completion(tempPosts)
        })
    }
    
    @IBAction func logoutButtonAction(_ sender: UIBarButtonItem) {
        try! Auth.auth().signOut()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return posts.count
        }else {
            return fetchingMore ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
            cell.selectionStyle = .none
            cell.set(post: posts[indexPath.row])
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.selectionStyle = .none
            cell.spinner.startAnimating()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath] ?? 72.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height * leadingScreenForBatching {
            if !fetchingMore && !endReached {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        self.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
        // Fetch posts
        fetchPosts { (newPosts) in
            self.posts.append(contentsOf: newPosts)
            self.fetchingMore = false
            self.endReached = newPosts.count == 0
           
            UIView.performWithoutAnimation {
                self.tableView.reloadData()
                
                self.listenForNewPosts()
            }
        }
    }
    
    var postListenerHandle: UInt?

    func listenForNewPosts() {
        
        guard !fetchingMore else { return }
        
        //Avoiding duplicate listeners
        stopListeningForNewPosts()
        
        postListenerHandle =  newPostsQuery.observe(.childAdded) { (snapshot) in
            
            if snapshot.key != self.posts.first?.id,
                let data = snapshot.value as? [String:Any],
                let post = Post.parse(snapshot.key, data) {
                
                self.stopListeningForNewPosts()
                
                if snapshot.key == self.lastUploadedPostID {
                    self.handleRefresh()
                    self.lastUploadedPostID = nil
                }else {
                    self.toggleSeeNewPostsButton(hidden: false)
                }
            }
        }
    }
    
    func stopListeningForNewPosts() {
        if let handle = postListenerHandle {
            newPostsQuery.removeObserver(withHandle: handle)
            postListenerHandle = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newPostNavBar = segue.destination as? UINavigationController,
            let newPostVC = newPostNavBar.viewControllers[0] as? NewPostViewController {
            
            newPostVC.delegate = self
            
        }
    }
  
}

extension HomeViewController: NewPostVCDelegate {
    func didUploadPost(withID id: String) {
        print("We sent a new post with id: \(id)")
        self.lastUploadedPostID = id
    }
    
    
}

