//
//  InfoViewController.swift
//  Bucket
//
//  Created by Patrick Anderson on 9/25/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBAction func doneButton(_ sender: AnyObject) {
        
    }
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    //@IBOutlet weak var infoTextView: UITextView!

    @IBOutlet weak var infoTextView: UITextField!
    
    //@IBOutlet weak var nameLabel: UITextField!
    
    var mickey = "Donald" //Title
    var hulk = false //Completed
    var yoDude = "Well Hello there!" //Description
    var iHateYou = 0
    var listItem: ListItem = ListItem(text: "", completed: false, info: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = self.nameLabel.text
        let descr = self.infoTextView.text
        let complete = self.completedSwitch.isOn
        if (name!.characters.count > 0) {
            self.listItem = ListItem(text: name!, completed: complete, info: descr!)
        }
        //print(mickey)
        //print(iHateYou)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = mickey
        completedSwitch.isOn = hulk
        infoTextView.text = yoDude
        
        // Do any additional setup after loading the view.
    }



}
