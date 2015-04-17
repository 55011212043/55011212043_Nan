//
//  ViewController.swift
//  coreDataExample
//
//  Created by iStudents on 3/20/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    //var items = [String]()
    var items = [NSManagedObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default){ (action: UIAlertAction!)-> Void in
            
            let textField = alert.textFields![0] as UITextField
            
            //self.items.append(textField.text)
            self.saveName(textField.text)
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){ (action: UIAlertAction!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        ////////ใส่ข้อมูลลงใน cell /////////
        //cell.textLabel!.text = items[indexPath.row]
        
        let item = items[indexPath.row]
        cell.textLabel!.text = item.valueForKey("name") as String?
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    
        let appDel:AppDelegate=UIApplication.sharedApplication().delegate as AppDelegate
        
        let context:NSManagedObjectContext=appDel.managedObjectContext!
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            context.deleteObject(items[indexPath.row] as NSManagedObject)
            items.removeAtIndex(indexPath.row)
            context.save(nil)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    func saveName(name: String){
       
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedContext)
        let item = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        item.setValue(name, forKey: "name")
        
        //4
        var error: NSError?
        if !managedContext.save(&error){
            println("Could not save \(error),\(error?.userInfo)")
        }
        
        //5 เพิ่มข้อมูลลงใน Core data ลงไปใน Items Array เพื่อแสดงใน table view
        items.append(item)
        
    }
    
    override func viewWillAppear(animated: Bool) {////ดึงข้อมูลออกมา
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let result = fetchedResults{
            items = result
        }else{
            println("Could not fetch \(error),\(error!.userInfo)")
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let result = fetchedResults{
            items = result
        }else{
            println("Could not fetch \(error),\(error!.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Shopping List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

