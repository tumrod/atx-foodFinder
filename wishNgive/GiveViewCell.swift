//
//  GiveViewCell.swift
//  wishNgive
//
//  Created by Briana Gray on 9/13/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class GiveViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBAction func toggleItemSelection(sender: AnyObject) {
        
        var button = sender as! UIButton
        var buttonImage = button.imageView?.image == UIImage(named: "checked_box") ? UIImage(named: "Unchecked_box") : UIImage(named: "checked_box")
        button.setImage(buttonImage, forState: UIControlState.Normal)
    }
}
