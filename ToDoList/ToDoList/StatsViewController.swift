//
//  StatsViewController.swift
//  ToDoList
//
//  Created by Helena Huang on 10/13/15.
//  Copyright © 2015 Helena Huang. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var taskCount = 0
    
    @IBOutlet weak var taskCountLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        taskCountLabel.text = String(taskCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
