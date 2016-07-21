//
//  NewTask.swift
//  roll
//
//  Created by Kabir Shah on 7/19/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class NewTask: UIViewController, UITextFieldDelegate {

    @IBOutlet var popupView: UIView!
    @IBOutlet var taskField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10
        popupView.layer.borderColor = UIColor.blackColor().CGColor
        popupView.layer.borderWidth = 0.25
        popupView.layer.shadowColor = UIColor.blackColor().CGColor
        popupView.layer.shadowOpacity = 0.6
        popupView.layer.shadowRadius = 15
        popupView.layer.shadowOffset = CGSize(width: 5, height: 5)
        popupView.layer.masksToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var taskText: String = taskField.text!
        MainTableViewController().addTask(taskText)
        self.performSegueWithIdentifier("unwindManual", sender: self)
        print("Textarea returned")
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
