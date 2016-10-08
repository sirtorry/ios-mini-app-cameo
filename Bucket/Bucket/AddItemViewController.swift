//
//  AddItemViewController.swift
//  Bucket
//
//  Created by Chen Yang on 10/6/16.
//  Copyright © 2016 Cameo. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {



    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descr: UITextField!
    @IBOutlet weak var complete: UISwitch!
    
    
    var mickey = "Donald" //Title
    var hulk = false //Completed
    var yoDude = "Well Hello there!" //Description
    var listItem: ListItem = ListItem(text: "", completed: false, info: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var name = self.name.text
        let descr = self.descr.text
        let complete = self.complete.isOn
        if (name!.characters.count > 0) {
            self.listItem = ListItem(text: name!, completed: complete, info: descr!)
        }
        
        
    }
    

    @IBAction func done(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
