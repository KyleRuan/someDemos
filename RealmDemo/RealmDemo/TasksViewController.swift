//
//  TasksViewController.swift
//  RealmDemo
//
//  Created by Jason on 16/2/29.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import RealmSwift

class TasksViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    var selectedList : TaskList!
    var openTasks : Results<Task>!
    var completedTasks : Results<Task>!
    var currentCreateAction:UIAlertAction!
    var isEditingMode = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        
    }
    
    func updateUI(){
        openTasks =  selectedList.tasks.filter("isCompleted = false")
        
        completedTasks = selectedList.tasks.filter("isCompleted = true")
        self.taskTableView.reloadData()
    
    }
    

    @IBAction func didSelectedEditButton(sender: UIBarButtonItem) {
        isEditingMode = !isEditingMode
        self.taskTableView.setEditing(isEditingMode, animated: true)
        
    }
    
    
    @IBAction func didSelectedAddButton(sender: UIBarButtonItem) {
        displayAlertToAddTaskList(nil)
    }
    
    func displayAlertToAddTaskList(task:Task?){
        var title = "New Tasks List"
        var doneTitle = "Create"
        if task != nil {
            title = "Update Tasks"
            doneTitle = "Update"
        }
        let alertVC = UIAlertController(title: title, message: "please input task name", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: doneTitle, style: UIAlertActionStyle.Default) { (_) -> Void in
            guard let taskName = alertVC.textFields?.first?.text else {
                return
            }
            
            if task == nil {
                  let newTask = Task()
                newTask.name = taskName
                try! uiRealm.write({ () -> Void in
                    self.selectedList.tasks.append(newTask)
//                    uiRealm.add(newTask)
                    self.updateUI()
                })
            }else{
               try! uiRealm.write({ () -> Void in
                
                task?.name = taskName
//                self.selectedList.tasks.append(task!)
//                uiRealm.add(task!)
                self.updateUI()
               })
            }
        }
           action.enabled = false
          currentCreateAction =  action
        
        alertVC.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Input task name"
            textfield.addTarget(self, action: "enableDoneButton:", forControlEvents: UIControlEvents.EditingChanged)
            if task != nil{
                textfield.text = task?.name
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (_) -> Void in
            //
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(action)
        self.presentViewController(alertVC, animated: true , completion: nil)
    }
    
    func enableDoneButton(textfiled:UITextField){
        currentCreateAction.enabled = textfiled.text?.characters.count>0
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension TasksViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  section == 0 ? openTasks.count:completedTasks.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "OPEN TASKS"
        }else{
            return "Completed Task"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasks", forIndexPath: indexPath)
        if indexPath.section == 0{
            cell.textLabel?.text =  openTasks[indexPath.row].name
        }else{
            cell.textLabel?.text = completedTasks[indexPath.row].name
        }
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let doneAciton = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Done") { (_, indexPath) -> Void in
            let updateTask:Task!
            if indexPath.section == 0 {
               updateTask = self.openTasks[indexPath.row]
            }else{
              updateTask =   self.completedTasks[indexPath.row]
            }
            try! uiRealm.write({ () -> Void in
                updateTask.isCompleted = true
                self.updateUI()
            })
            
            
              //to do done
        }
        
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (_, _) -> Void in
            // to do edit
            if indexPath.section == 0 {
                self.displayAlertToAddTaskList(self.openTasks[indexPath.row])
            }else{
                self.displayAlertToAddTaskList(self.completedTasks[indexPath.row])
            }
            
//            displayAlertToAddTaskList()
        }
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") { (_, _) -> Void in
            // to delet
          
            var taskToBeDeleted: Task!
            if indexPath.section == 0{
                taskToBeDeleted = self.openTasks[indexPath.row]
            }
            else{
                taskToBeDeleted = self.completedTasks[indexPath.row]
            }
            
          
           try! uiRealm.write({ () -> Void in
               uiRealm.delete(taskToBeDeleted)
            self.updateUI()
            })
            
        }
        
        return [deleteAction,editAction,doneAciton]
        
    }
}