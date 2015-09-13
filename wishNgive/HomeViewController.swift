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
    var userDataMan = UserDataManager.userManagerSharedInstance
    private var userObject: Users?
    
    var name: String? {
        didSet {
            usernameLabel.text = "Hello,  " + name!
        }
    }
    
    override func viewDidLoad() {
        usernameLabel.text = "Hello"
        setUser({
            
            if let userName = self.userObject?.userName {
                self.usernameLabel.text = "Hello \(userName)"
            }
        })
        
        //returnUserData()
    }
    
    /*@IBAction func testBtn(sender: AnyObject) {
    var uTest = UserDataManager()
    uTest.writeData()
    }*/
    
    func setUser(completion: (Void -> Void)?) {
        userDataMan.getUser() { (main) -> Void in
            self.userObject = main
            completion!()
        }
    }
    
    
}
