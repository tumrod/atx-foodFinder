//
//  UserDataManager.swift
//  wishNgive
//
//  Created by Tipparat Umrod on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class UserDataManager {
    let myRootRef = Firebase(url:"https://wishngive.firebaseio.com/")
    var mainUser:Users?
    
    func writeData(u: Users) {
        
        // Write data to Firebase
        var usersRef = myRootRef.childByAppendingPath("users/")
        
        //var u = inputUserData("bob")
        var uRef = usersRef.childByAppendingPath("\(u.userName)/")
        
        var wishListRef = uRef.childByAppendingPath("wishList/")
        wishListRef.setValue(u.getWishList())
        
        
        var friendListRef = uRef.childByAppendingPath("friends/")
        friendListRef.setValue(u.getFriendList())
        
    }
    
    func readData() {
        // Read data and react to changes
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }
    
    func inputUserData(name: String/*, friendList:[String], wishlist:[String]*/) -> Users{
        var u = Users.init(userName:name, fbId:0)!
        
        // in a loop because of many friends
        var friend = Users.init(userName:"bob's friend", fbId:1 /*userName: String*/)!
        u.addFriend(friend)
        
        // in a loop because of many wishes
        var wishlist = ["pen", "pencil"]
        for w in wishlist {
            var i = Item.init(itemName: w)!
            u.addItem(i)
        }
        
        return u
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                //println("fetched user: \(result)")
                var resultDictionary = result as! Dictionary<String, AnyObject>
                
                
                let uName = resultDictionary["name"] as! String
                var uId = 0
                
                if let nsid: NSNumber = resultDictionary["id"] as? NSNumber {
                    uId = Int(nsid)
                }

                //println("User Name is: \(uName) user Id is: \(uId)")
                
                self.mainUser = Users(userName: uName, fbId: uId)!
                
                //u?.description()
                
                // No longer valid
                //let userEmail : NSString = result.valueForKey("email") as! NSString
                //println("User Email is: \(userEmail)")
                
            }
        })
    }
    
    func returnUserFriends()
    {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me/friends", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                //println("fetched friends: \(result)")
                
                
                var responseDict = result as! Dictionary<String, AnyObject>
                
                //println("response: \(responseDict)")
                
                var friendList = responseDict["data"] as? Array<Dictionary<String, AnyObject>>
                
                if let friends = friendList {
        
                    for var index = 0; index < friends.count; index++ {
                        
                        var friendObject = friends[index] as Dictionary<String, AnyObject>
                        
                        var friendName = friendObject["name"] as! String
                        var friendId = friendObject["id"] as! String
                        var friendIdInt = friendId.toInt()!
                        
                        var friendUser = Users(userName:friendName, fbId: friendIdInt)
                        self.mainUser!.addFriend(friendUser!)
    
                        
                    }
                    self.mainUser?.description()
                }
                
            }
        })
    }
}