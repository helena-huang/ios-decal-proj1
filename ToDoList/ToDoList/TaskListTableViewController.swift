//
//  TaskListTableViewController.swift
//  ToDoList
//
//  Created by Helena Huang on 10/12/15.
//  Copyright © 2015 Helena Huang. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    var taskListNames = [String]()
    var taskListBools = [Bool]()
    var taskListTimes = [NSDate?]()
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskListNames.count
    }
    
    @IBAction func cancelAddedTask (segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveAddedTask (segue: UIStoryboardSegue) {
        let addTaskViewController = segue.sourceViewController as! AddTaskTableViewController
        let name = addTaskViewController.taskName
        if name != "" {
            taskListNames.append(name!)
            taskListBools.append(false)
            taskListTimes.append(nil)
            self.tableView.reloadData()
        }
    }

    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        // Get rid of old tasks
        let current_time = NSDate()
        for time in taskListTimes {
            if time != nil && current_time.timeIntervalSinceDate(time!) > 86400 {
                taskListNames.removeAtIndex(indexPath.row)
                taskListBools.removeAtIndex(indexPath.row)
                taskListTimes.removeAtIndex(indexPath.row)
            }
        }
        
        // Configure the cell...
        cell.textLabel?.text = taskListNames[indexPath.row]
        if taskListBools[indexPath.row] == true {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        taskListBools[indexPath.row] = !taskListBools[indexPath.row]
        taskListTimes[indexPath.row] = NSDate()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            taskListNames.removeAtIndex(indexPath.row)
            taskListBools.removeAtIndex(indexPath.row)
            taskListTimes.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                if (segue.identifier == "ToStats") {
                    var taskCount = 0
                    for taskBool in taskListBools {
                        if taskBool {
                            taskCount += 1
                        }
                    }
                    let nav = segue.destinationViewController as! UINavigationController
                    let dest = nav.topViewController as! StatsViewController
                    dest.taskCount = taskCount
                }
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
