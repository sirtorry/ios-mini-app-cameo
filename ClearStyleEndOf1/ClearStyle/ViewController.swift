//
//  ViewController.swift
//  ClearStyle
//
//  Created by Audrey M Tam on 4/08/2014.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {
                            
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = UIColor.black
//        tableView.rowHeight = 50;
        
        if toDoItems.count > 0 {
            return
        }
        toDoItems.append(ToDoItem(text: "feed the cat"))
        toDoItems.append(ToDoItem(text: "buy eggs"))
        toDoItems.append(ToDoItem(text: "watch WWDC videos"))
//        toDoItems.append(ToDoItem(text: "rule the Web"))
//        toDoItems.append(ToDoItem(text: "buy a new iPhone"))
//        toDoItems.append(ToDoItem(text: "darn holes in socks"))
//        toDoItems.append(ToDoItem(text: "write this tutorial"))
//        toDoItems.append(ToDoItem(text: "master Swift"))
//        toDoItems.append(ToDoItem(text: "learn to draw"))
//        toDoItems.append(ToDoItem(text: "get more exercise"))
//        toDoItems.append(ToDoItem(text: "catch up with Mom"))
//        toDoItems.append(ToDoItem(text: "get a hair cut"))
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//            cell.textLabel?.backgroundColor = UIColor.clearColor()
            
            cell.selectionStyle = .none
            let item = toDoItems[(indexPath as NSIndexPath).row]
//            cell.textLabel?.text = item.text
            cell.delegate = self
            cell.toDoItem = item
            return cell
    }
    
    func toDoItemDeleted(_ toDoItem: ToDoItem) {
        // could use this to get index when Swift Array indexOfObject works
        // let index = toDoItems.indexOfObject(toDoItem)
        // in the meantime, scan the array to find index of item to delete
        var index = 0
        for i in 0..<toDoItems.count {
            if toDoItems[i] === toDoItem {  // note: === not ==
                index = i
                break
            }
        }
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoItems.remove(at: index)
        
        // use the UITableView to animate the removal of this row
        tableView.beginUpdates()
        let indexPathForRow = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPathForRow], with: .fade)
        tableView.endUpdates()    
    }
    
    // MARK: - Table view delegate
    
//    func colorForIndex(_ index: Int) -> UIColor {
//        let itemCount = toDoItems.count - 1
//        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
//        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
//        forRowAt indexPath: IndexPath) {
//            cell.backgroundColor = colorForIndex((indexPath as NSIndexPath).row)
//    }
    
    // support for versions of iOS prior to iOS 8
    func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat {
            return tableView.rowHeight;
    }

}

