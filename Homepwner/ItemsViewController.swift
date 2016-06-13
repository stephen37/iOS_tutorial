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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return itemStore.allItems.count
    }
}
