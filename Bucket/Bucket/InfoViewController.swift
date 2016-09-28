//
//  InfoViewController.swift
//  Bucket
//
//  Created by Patrick Anderson on 9/25/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!

    
    //@IBOutlet weak var nameLabel: UITextField!
    
    var mickey = "Donald"
    var hulk = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = mickey
        completedSwitch.isOn = hulk
        
        // Do any additional setup after loading the view.
    }



}
