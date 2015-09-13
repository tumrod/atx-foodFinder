//
//  GiftViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    var user: Dictionary<String, AnyObject>?
    
    override func viewDidLoad() {
        var name = ""
        if let userDict = user {
            name = userDict["name"] as! String
        }
        
        userNameLabel.text = " \(name)'s List"
    }
    
}
