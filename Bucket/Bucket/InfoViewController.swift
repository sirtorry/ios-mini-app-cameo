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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var infoTextView: UITextView!

    
    //@IBOutlet weak var nameLabel: UITextField!
    
    var mickey = "Donald"
    var hulk = false
    var yoDude = "Well Hello there!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = mickey
        completedSwitch.isOn = hulk
        infoTextView.text = yoDude
        
        // Do any additional setup after loading the view.
    }



}
