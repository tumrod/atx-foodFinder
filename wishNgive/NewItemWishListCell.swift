//
//  NewItemWishListCell.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

protocol NewitemWishListCellDelegate: class {
    func addedNewItemToWishList(itemName: String)
    func updatedTableCell()
}

class NewItemWishListCell: UITableViewCell {

    @IBOutlet weak var newItemtextField: UITextField!
    @IBOutlet weak var newCellView: UIView!
    @IBOutlet weak var createdCellView: UIView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    weak var delegate: NewitemWishListCellDelegate?
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        newCellView.hidden = true
        itemNameLabel.text = newItemtextField.text
        
        delegate?.addedNewItemToWishList(newItemtextField.text)
        delegate?.updatedTableCell()
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        newCellView.hidden = false
        newItemtextField.text = ""
        delegate?.updatedTableCell()

    }
}
