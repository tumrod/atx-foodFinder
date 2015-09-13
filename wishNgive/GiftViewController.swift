//
//  GiftViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userNameLabel: UILabel!
    var user: Dictionary<String, AnyObject>?
    
    override func viewDidLoad() {
        var name = ""
        if let userDict = user {
            name = userDict["name"] as! String
        }
        
        userNameLabel.text = " \(name)'s List"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        var giveListCell = tableView.dequeueReusableCellWithIdentifier("GiveTableViewCell") as! GiveViewCell
        giveListCell.itemNameLabel.text = "Toy"
        
        cell = giveListCell
        return cell
    }

    
}
