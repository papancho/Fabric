//
//  DoneTableViewController.swift
//  Fabric
//
//  Created by Shen Jin on 2016-06-26.
//  Copyright © 2016 Samantha Lauer. All rights reserved.
//

import UIKit

class DoneTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var tasks = [Task]()
    
    func initTasks() {
        if let savedTasks = loadTasks(Task.ArchiveURLDone) {
            tasks = savedTasks
            print("task count 2 is: \(tasks.count)")
        }
    }
    
    func addTask(task: Task) {
        print("Call to addTask in DoneTable for task \(task)")
        initTasks()
        print("task count 2 is: \(tasks.count)")
        tasks += [task]
        
        // Save done tasks
        saveTasks(tasks, url: Task.ArchiveURLDone)
        
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load done tasks
        if let savedTasks = loadTasks(Task.ArchiveURLDone) {
            tasks = savedTasks
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell: TaskTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Done") as! TaskTableViewCell

        let task = tasks[indexPath.row]
        cell.nameLabel.text = task.name

        // Configure the cell...

        return cell
    }

}
