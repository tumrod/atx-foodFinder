//
//  WishViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class WishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var wishListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishListTableView.delegate = self
        
    }
    
    @IBAction func toggleEditMode(sender: AnyObject) {
        var editSwitch = sender as! UISwitch
        
        if editSwitch.on { // ON
            wishListTableView.editing = true
        }
        else {
            wishListTableView.editing = false
        }
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        var newItemWishListCell  = tableView.dequeueReusableCellWithIdentifier("NewItemWishListTableViewCell") as! NewItemWishListCell
        
        newItemWishListCell.showsReorderControl = wishListTableView.editing
        
        cell = newItemWishListCell
        
        return cell
    }
    
}
