//
//  Item.swift
//  wishNgive
//
//  Created by Ashley Toops on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class Item {
    
    //var itemId: Int
    var itemName: String
    
    init?(itemName: String) {
        //self.itemId = itemId
        self.itemName = itemName
        
        if itemName.isEmpty {
            return nil
        }
    }
    
}