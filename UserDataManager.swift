//
//  UserDataManager.swift
//  wishNgive
//
//  Created by Tipparat Umrod on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import Foundation
import Firebase

class UserDataManager {
    var myRootRef = Firebase(url:"https://wishngive.firebaseio.com/")
    
    func writeData() {
        
        // Write data to Firebase
        myRootRef.setValue("hello")
        
    }
    
    func readData() {
        // Read data and react to changes
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
        })
    }
}