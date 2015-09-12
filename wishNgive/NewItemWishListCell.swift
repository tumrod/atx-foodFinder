//
//  NewItemWishListCell.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class NewItemWishListCell: UITableViewCell {

    @IBOutlet weak var newItemtextField: UITextField!
    @IBOutlet weak var newCellView: UIView!
    @IBOutlet weak var createdCellView: UIView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        newCellView.hidden = true
        itemNameLabel.text = newItemtextField.text
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        newCellView.hidden = false
        newItemtextField.text = ""
    }
}
