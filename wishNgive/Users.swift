//
//  Users.swift
//  wishNgive
//
//  Created by Ashley Toops on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit
import SwiftyJSON

class Users {
    
    var userName: String
    var wishList: [Item]
    var friendList: [Users]
    var fbId: Int
    
    init?(userName: String, fbId: Int) {
        self.userName = userName
        self.wishList = [Item]()
        self.friendList = [Users]()
        self.fbId = fbId
        
        if userName.isEmpty {
            return nil
        }
        
    }
    
    func addItem(newItem: Item) {
        wishList.append(newItem)
    }
    
    func addFriend(newFriend: Users) {
        friendList.append(newFriend)
    }
    
    func description() {
        println("Data for: \(userName)")
        print("wish: ")
        for wish in wishList {
            print("\(wish.itemName) ")
        }
        print("friends: ")
        for friend in friendList {
            print("\(friend.userName) ")
        }
    }
    
    func getWishList() -> [String] {
        var strWishList = [String]()
        for w in wishList {
            strWishList.append(w.itemName)
        }
        return strWishList
    }
    
    func getFriendList() -> [String] {
        var strFriendList = [String]()
        for f in friendList {
            strFriendList.append(f.userName)
        }
        return strFriendList
    }
    
}