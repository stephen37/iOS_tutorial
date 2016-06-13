//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by stephen batifol on 12/06/16.
//  Copyright © 2016 stephen batifol. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController  {

    var itemStore: ItemStore!
    
    @IBAction func addNewItem(sender: AnyObject){
        let newItem = itemStore.createItem()
        
        
        if let index = itemStore.allItems.indexOf(newItem) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        }
        //Make a new index path for the 0th section, last row
//        
//        let lastRow = tableView.numberOfRowsInSection(0)
//        let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
//        
        //Insert this new row into the table
        
    }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        if editing {
            sender.setTitle("Edit", forState: .Normal)
            
            setEditing(false, animated: true)
        }else {
            sender.setTitle("Done", forState: .Normal)
            
            setEditing(true, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return itemStore.allItems.count
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // If the table view is asking to commit a delete
        if editingStyle == .Delete {
            let item = itemStore.allItems[indexPath.row]
            itemStore.removeItem(item)
            
            //Remove the row from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        //Set the text on the cell with the description of the item that is at the nth index of the items, where n = row,
        // this cell will appear on this tableView
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        // Display "No more item when we reach the last item
//        if (indexPath.row == itemStore.allItems.count - 1) {
//            cell.textLabel?.text = "No more item"
//            cell.detailTextLabel?.text = "-"
//        }
        return cell
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        //Update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    
}
