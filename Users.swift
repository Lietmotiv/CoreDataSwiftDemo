//
//  Users.swift
//  CoreDataTest
//
//  Created by Doug on 8/5/14.
//  Copyright (c) 2014 Doug Clayton. All rights reserved.
//

import UIKit
import CoreData

@objc(Users)  // So that the Users class is available to the CoreData libraries which is in ObjC (not swift)
class Users: NSManagedObject {
    
    @NSManaged var username: String;
    @NSManaged var password: String;
    

    
    
}
