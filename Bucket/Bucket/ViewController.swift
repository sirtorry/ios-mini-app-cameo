//
//  ViewController.swift
//  Bucket
//
//  Created by Patrick Anderson on 9/25/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {




    @IBOutlet weak var tableView: UITableView!
    
    var listItems = [ListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        // "Get the First Ticket at Bodo's", "Streak the Lawn", "Wear a bow-tie to a home football game"
        
        if listItems.count > 0 {
            return
        }
        listItems.append(ListItem(text: "Get the First Ticket at Bodo's"))
        listItems.append(ListItem(text: "Streak the Lawn"))
        listItems.append(ListItem(text: "Wear a bow-tie to a home football game"))
    }
    
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        let item = listItems[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = item.text
        cell.delegate = self
        cell.toDoItem = item
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        //            cell.textLabel?.backgroundColor = UIColor.clearColor()
//        
//        cell.selectionStyle = .none
//        let item = listItems[(indexPath as NSIndexPath).row]
//        cell.textLabel?.text = item.text
//        cell.delegate = self
//        cell.toDoItem = item
//        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "InfoSegue", sender: listItems[indexPath.row].text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! InfoViewController
        guest.mickey = sender as! String
    }
    
    

    
    internal func toDoItemDeleted(_ todoItem: ListItem) {
        // could use this to get index when Swift Array indexOfObject works
        // let index = toDoItems.indexOfObject(toDoItem)
        // in the meantime, scan the array to find index of item to delete
        var index = 0
        for i in 0..<listItems.count {
            if listItems[i] === todoItem {  // note: === not ==
                index = i
                break
            }
        }
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        listItems.remove(at: index)
        
        // use the UITableView to animate the removal of this row
        tableView.beginUpdates()
        let indexPathForRow = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPathForRow], with: .fade)
        tableView.endUpdates()
    }
    
    
    

    
}

