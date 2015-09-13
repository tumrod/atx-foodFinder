//
//  WishViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class WishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewitemWishListCellDelegate {
    
    @IBOutlet weak var wishListTableView: UITableView!
    
    var tableData = ["Toys", "Dogs", "iPad", "Car", "Apple Pencil"]
    var userDataMan = UserDataManager.userManagerSharedInstance
    private var userObject: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishListTableView.delegate = self
        addItemToUser()
    }
    
    @IBAction func toggleEditing(sender: AnyObject) {
        wishListTableView.editing = !wishListTableView.editing
        
        var editModeItem = sender as! UIBarButtonItem
        editModeItem.title = wishListTableView.editing ? "Done" : "Edit"
    }
    
    func addItemToUser() {
        userDataMan.mainUser?.wishList.removeAll(keepCapacity: false)

        for i in self.tableData {
            var myItem = Item(itemName: i)
            userDataMan.mainUser?.addItem(myItem!)
            println(myItem)
        }
        userDataMan.writeData()
        
    }
    
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + tableData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        var newItemWishListCell  = tableView.dequeueReusableCellWithIdentifier("NewItemWishListTableViewCell") as! NewItemWishListCell
        
        newItemWishListCell.showsReorderControl = wishListTableView.editing
        newItemWishListCell.delegate = self
        
        if  indexPath.row < tableData.count {
            newItemWishListCell.itemNameLabel.text = tableData[indexPath.row]
            newItemWishListCell.newCellView.hidden = true
        }
        
        cell = newItemWishListCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row < tableData.count
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        if (destinationIndexPath.row < tableData.count && sourceIndexPath.row < tableData.count) {
            var itemToMove = tableData[sourceIndexPath.row]
            tableData.removeAtIndex(sourceIndexPath.row)
            tableData.insert(itemToMove, atIndex: destinationIndexPath.row)
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row < tableData.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tableData.removeAtIndex(indexPath.row)
            wishListTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        
        if proposedDestinationIndexPath.row >= tableData.count {
            return sourceIndexPath
        }
        else {
            return proposedDestinationIndexPath
        }
    }
    
    //MARK: NewitemWishListCellDelegate
    func addedNewItemToWishList(itemName: String) {
        tableData.append(itemName)
        
        wishListTableView.reloadData()
    }
    
    func updatedTableCell() {
        addItemToUser()
    }

}
