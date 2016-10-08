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
    var indexy = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        if listItems.count > 0 {
            return
        }
        listItems.append(ListItem(text: "Get the First Ticket at Bodo's", completed: false, info: ""))
        listItems.append(ListItem(text: "Streak the Lawn", completed: false, info: ""))
        listItems.append(ListItem(text: "Do something else", completed: false, info: ""))
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
        //print(indexPath.row)
        indexy = indexPath.row
        performSegue(withIdentifier: "InfoSegue", sender: listItems[indexPath.row])
        //print(indexPath.row)
        //indexy = indexPath.row
        //performSegue(withIdentifier: "SaveStateSegue", sender: InfoViewController.self) do this in info controller
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            _ = segue.destination as! AddItemViewController
        }
        else {
            let guest = segue.destination as! InfoViewController
            var l = ListItem(text: "Hi", completed: false, info: "")
            
            l = sender as! ListItem
            guest.hulk = l.completed
            guest.mickey = l.text
            guest.yoDude = l.info
            //print(indexy)
            guest.iHateYou = indexy
        }
        
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let source = segue.source as! InfoViewController
        //print(source.iHateYou)
        let listItem:ListItem = source.listItem
        //let listItems[source.iHateYou] = source.listItem
        
        
        if listItem.text != "" {
            listItems[source.iHateYou] = listItem
            self.tableView.reloadData()        }
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
        let source = segue.source as! AddItemViewController
        let listItem:ListItem = source.listItem
        
        if listItem.text != "" {
            self.listItems.append(listItem)
            self.tableView.reloadData()        }
    }
    

    
}

