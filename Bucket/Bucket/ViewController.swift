//
//  ViewController.swift
//  Bucket
//
//  Created by Patrick Anderson on 9/25/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {


    @IBAction func addItem(_ sender: AnyObject) {
        performSegue(withIdentifier: "add", sender:sender)
    }


    @IBOutlet weak var tableView: UITableView!
    
    var listItems = [ListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        if listItems.count > 0 {
            return
        }
        listItems.append(ListItem(text: "Get the First Ticket at Bodo's"))
        listItems.append(ListItem(text: "Streak the Lawn"))
        listItems.append(ListItem(text: "Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text Long String of Text "))
    }
    
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        let item = listItems[(indexPath as NSIndexPath).row]
//        cell.textLabel?.text = item.text
        cell.delegate = self
        cell.toDoItem = item
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "InfoSegue", sender: listItems[indexPath.row])
        //performSegue(withIdentifier: "SaveStateSegue", sender: InfoViewController.self) do this in info controller
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let guest = segue.destination as! InfoViewController
        }
        else {
            let guest = segue.destination as! InfoViewController
            var l = ListItem(text: "Hi")
            l = sender as! ListItem
            guest.hulk = l.completed
            guest.mickey = l.text
            guest.yoDude = l.info
        }
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        print("Unwinding")
    }

    
    internal func toDoItemDeleted(_ todoItem: ListItem) {
//        // could use this to get index when Swift Array indexOfObject works
//        // let index = toDoItems.indexOfObject(toDoItem)
//        // in the meantime, scan the array to find index of item to delete
//        var index = 0
//        for i in 0..<listItems.count {
//            if listItems[i] === todoItem {  // note: === not ==
//                index = i
//                break
//            }
//        }
//        // could removeAtIndex in the loop but keep it here for when indexOfObject works
//        listItems.remove(at: index)
//        
//        // use the UITableView to animate the removal of this row
//        tableView.beginUpdates()
//        let indexPathForRow = IndexPath(row: index, section: 0)
//        tableView.deleteRows(at: [indexPathForRow], with: .fade)
//        tableView.endUpdates()
    }
    
    @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
        //to-do: change so that it edits instead of adding new
        let source = segue.source as! InfoViewController
        let listItem:ListItem = source.listItem
        
        if listItem.text != "" {
            self.listItems.append(listItem)
            self.tableView.reloadData()        }
    }
    

    
}

