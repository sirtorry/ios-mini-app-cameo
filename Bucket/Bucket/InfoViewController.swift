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
    @IBOutlet weak var infoTextView: UITextView!

    
    //@IBOutlet weak var nameLabel: UITextField!
    
    var mickey = "Donald" //Title
    var hulk = false //Completed
    var yoDude = "Well Hello there!" //Description
    var listItem: ListItem = ListItem(text: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var name = self.nameLabel.text
        if (name!.characters.count > 0) {
            self.listItem = ListItem(text: name!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = mickey
        completedSwitch.isOn = hulk
        infoTextView.text = yoDude
        
        // Do any additional setup after loading the view.
    }



}
