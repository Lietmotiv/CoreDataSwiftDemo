//
//  vcMain.swift
//  CoreDataTest
//
//  Created by Doug on 8/5/14.
//  Copyright (c) 2014 Doug Clayton. All rights reserved.
//

import UIKit
import CoreData


class vcMain: UIViewController {
    
    @IBOutlet var txtUserName: UITextField!;
    @IBOutlet var txtPassword: UITextField!;
    
    @IBAction func btnSave_Clicked(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        let context:NSManagedObjectContext = appDel.managedObjectContext!;
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context);
        
        var newUsers = Users(entity: ent, insertIntoManagedObjectContext: context);
        
        newUsers.username = txtUserName.text;
        newUsers.password = txtPassword.text;
        
        context.save(nil);
        
        println(newUsers);
        println("Object Created");
        
        
        
        
    }

    @IBAction func btnLoad_Clicked(){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
        let context:NSManagedObjectContext = appDel.managedObjectContext!;
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false; //Returns an instance of what we are looking for.
        
        request.predicate = NSPredicate(format: "username = %@", txtUserName.text)
        var results: NSArray = context.executeFetchRequest(request, error: nil);
        
        if (results.count > 0){
            println("results found");
            for user in results{
                var thisUser = user as Users;
                println("The Username = \(thisUser.username) and pw = \(thisUser.password)")
                txtUserName.text = thisUser.username;
                txtPassword.text = thisUser.password;
                
                
            }
            
        }else{
            println("nada");
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   
}
