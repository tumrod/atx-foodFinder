//
//  Table.swift
//  wishNgive
//
//  Created by Ashley Toops on 9/12/15.
//  Copyright (c) 2015 div-hack. All rights reserved.
//

import SQLite

let path = NSSearchPathForDirectoriesInDomains(
    .DocumentDirectory, .UserDomainMask, true
    ).first as! String

let db = Database("\(path)/db.sqlite3")