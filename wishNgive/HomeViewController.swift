//
//  HomeViewController.swift
//  wishNgive
//
//  Created by Briana Gray on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    var name: String? {
        didSet {
            usernameLabel.text = "Hello,  " + name!
        }
    }
    
    var userId: Int?
    
    override func viewDidLoad() {
        usernameLabel.text = "Hello"
        
        returnUserData()
    }
    
    @IBAction func testBtn(sender: AnyObject) {
        var uTest = UserDataManager()
        uTest.writeData()
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
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                self.name = result.valueForKey("name") as? String
                println("User Name is: \(userName)")
                
                self.userId = result.valueForKey("id") as? Int
                // No longer valid
                //let userEmail : NSString = result.valueForKey("email") as! NSString
                //println("User Email is: \(userEmail)")
            }
        })
    }

}
