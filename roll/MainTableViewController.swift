//
//  MainTableViewController.swift
//  roll
//
//  Created by Kabir Shah on 7/19/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit
import AVFoundation


class MainTableViewController: UITableViewController, Dimmable {
    

    let gradientLayer = CAGradientLayer()
    var tasks = ["This is your First Note", "Swipe Down to Create One", "Swipe this left or right to delete it"]
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5
    let systemSoundId: SystemSoundID = 1117
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no table seperators
        tableView.separatorStyle = .None
                
        // background gradient
        self.view.backgroundColor = UIColor.blackColor()
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(red: 0.20, green: 0.56, blue: 0.31, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 0.34, green: 0.71, blue: 0.83, alpha: 1.0).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.insertSublayer(gradientLayer, atIndex:0)
        
//        // swipe down action
//        let swipeDown = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
//        swipeDown.direction = .Down
//        self.view.addGestureRecognizer(swipeDown)
        
        // refresh
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dim(.In, alpha: dimLevel, speed: dimSpeed)
    }
    
    @IBAction func unwindFromNewTask(segue: UIStoryboardSegue) {
        dim(.Out, speed: dimSpeed)
    }
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
//    func handleSwipe(gesture:UISwipeGestureRecognizer) {
//        if (gesture.direction == .Down) {
////            print("Swipe Down")
////            AudioServicesPlaySystemSound(systemSoundId)
////            refreshControl!.endRefreshing()
////            performSegueWithIdentifier("newTaskSwipe", sender: gesture)
//        }
//    }
    
    func refresh(sender:AnyObject) {
        print("Swipe Down")
        AudioServicesPlaySystemSound(systemSoundId)
        refreshControl!.endRefreshing()
        performSegueWithIdentifier("newTaskSwipe", sender: sender)

    }
    
    func addTask(taskText: String) {
        tasks.append(taskText)
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Item", forIndexPath: indexPath)
        
        cell.textLabel?.font = UIFont(name:"Avenir Next", size:13)
        cell.textLabel?.text = tasks[indexPath.row].uppercaseString
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
