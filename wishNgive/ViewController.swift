//
//  ViewController.swift
//  wishNgive
//
//  Created by Tipparat Umrod on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//
//  Credit: http://www.brianjcoleman.com/tutorial-how-to-use-login-in-facebook-sdk-4-0-for-swift/

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let dbMgr = UserDataManager.userManagerSharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            initDb()
            showHomeViewController()
            
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
        
    }
    
    // initialize database
    func initDb() {
        
        dbMgr.fetchUserData() {
            (user) -> Void in
            
            self.dbMgr.fetchUserFriends() {
                //self.dbMgr.writeData(user)
            }
        }
        
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
        
        showHomeViewController()
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    private func showHomeViewController() {
        
        var pagesViewController = appDelegate.pagesStoryBoard.instantiateViewControllerWithIdentifier("pages-home") as! UINavigationController
        view.addSubview(pagesViewController.view)
        presentViewController(pagesViewController, animated: true, completion: nil)
    }
}


