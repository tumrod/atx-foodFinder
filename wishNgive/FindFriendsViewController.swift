//
//  FindFriendsViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class FindFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var friendsTableView: UITableView!
    
    private var friendsTableData: [String]? {
        didSet {
            friendsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        returnUserFriends()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let friendTable = friendsTableData {
            return friendTable.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        var friendListCell = tableView.dequeueReusableCellWithIdentifier("friendListTableViewCell") as! UITableViewCell

        friendListCell.textLabel?.text = "Hello "
        
        cell = friendListCell
        return cell
    }
    
    func returnUserFriends()
    {
    
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "10207791439402728/friends", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched friends: \(result)")

            }
        })
    }

    
}
