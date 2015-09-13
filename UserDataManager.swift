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
    
    static let userManagerSharedInstance = UserDataManager()
    
    func writeData() {
        
        // Write data to Firebase
        var usersRef = myRootRef.childByAppendingPath("users/")
        
        //var u = inputUserData("bob")
        var uRef = usersRef.childByAppendingPath("\(self.mainUser!.userName)/")
        
        var wishListRef = uRef.childByAppendingPath("wishList/")
        wishListRef.setValue(self.mainUser!.getWishList())
        
        
        var friendListRef = uRef.childByAppendingPath("friends/")
        friendListRef.setValue(self.mainUser!.getFriendList())
        
    }
    
    func readData() {
        // Read data and react to changes
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }
    
    
    func getUser(completion: ((main: Users) -> Void)?){
        
        fetchUserData({
            (user) -> Void in
            completion!(main: user)
        })
        
    }
    
    func fetchUserData(completion: (Users -> Void)? )
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
                completion!(self.mainUser!)
                //u?.description()
                
                // No longer valid
                //let userEmail : NSString = result.valueForKey("email") as! NSString
                //println("User Email is: \(userEmail)")
                
            }
        })
    }
    
    func fetchUserFriends(completion: (Void -> Void)?)
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
                    
                    completion!()
                }
                
            }
        })
    }
}