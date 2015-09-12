//
//  Users.swift
//  wishNgive
//
//  Created by Ashley Toops on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class Users {
    
    var userId: Int
    var userName: String
    
    init?(userId: Int, userName: String) {
        self.userId = userId
        self.userName = userName
        
        if userName.isEmpty {
            return nil
        }
    }
}