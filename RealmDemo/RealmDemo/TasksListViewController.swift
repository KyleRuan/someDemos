//
//  TasksListViewController.swift
//  RealmDemo
//
//  Created by Jason on 16/2/29.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import RealmSwift

class TasksListViewController: UIViewController {

    var resultsList:Results<TaskList>!
    
    var isEditingMode = false
    
    var currentCreateAction:UIAlertAction!
    
    let token = uiRealm.addNotificationBlock({ (notification, realm) -> Void in
        print("THIS IS A  NOTIFICATION")
    })
    
    
    @IBOutlet weak var taskListsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     var config = Realm.Configuration()
        config.path = NSURL.fileURLWithPath(config.path!).URLByDeletingLastPathComponent?.URLByAppendingPathComponent("kyle.realm").path
        
        
        
        let zz = try! Realm(configuration: config)
        let path = NSURL.fileURLWithPath(uiRealm.path).URLByDeletingLastPathComponent?.URLByAppendingPathComponent("zz.realm").path
        print(path)
       try! zz.writeCopyToPath(path!)
        print(zz.path)
        print(uiRealm.path)
    
      
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
//        token.stop()
    }
    @IBAction func didClickOnEditButton(sender: AnyObject) {
         isEditingMode = !isEditingMode
        self.taskListsTableView.setEditing(isEditingMode, animated: true )
    }
    
    @IBAction func didClickOnAddButton(sender: AnyObject) {
          displayAlertToAddTaskList(nil)
    }
    
    func displayAlertToAddTaskList(updatedList:TaskList!){
        var title = "New Tasks List"
        var doneTitle = "Create"
        if updatedList != nil{
            title = "Update Tasks List"
            doneTitle = "Update"
        }
        
      let  alertVC = UIAlertController(title: title, message: " Input taskList Name", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: doneTitle, style: UIAlertActionStyle.Default) { (_) -> Void in
//     添加或者更新
            let nameList = alertVC.textFields?.first?.text
            
            if updatedList != nil{
              try! uiRealm.write({ () -> Void in
                 updatedList.name = nameList!
                self.updateUI()
               })
                
            }else {
                let newTaskList = TaskList()
                newTaskList.name = nameList!
                try! uiRealm.write({ () -> Void in
                   uiRealm.add(newTaskList)
                    self.updateUI()
                })
            }
            
        }
        alertVC.addAction(action)
        action.enabled = false
        self.currentCreateAction = action

        alertVC.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertVC.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "input Task Name"
            textfield.addTarget(self, action: "listNameFieldDidChange:", forControlEvents:.EditingChanged)
            if updatedList != nil {
                 textfield.text = updatedList.name
            }
        }
            presentViewController(alertVC, animated: true , completion: nil)
    }
    
    
    func listNameFieldDidChange(textfield :UITextField){
       
        self.currentCreateAction.enabled = textfield.text?.characters.count>0
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         updateUI()
    }
    
    
    func updateUI(){
//        uiRealm.addNotificationBlock(<#T##block: NotificationBlock##NotificationBlock##(notification: Notification, realm: Realm) -> Void#>)
      
        resultsList = uiRealm.objects(TaskList)
        
        
      
         self.taskListsTableView.setEditing(false , animated: true)
         self.taskListsTableView.reloadData()
        
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

extension TasksListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("taskList", forIndexPath: indexPath)
        let list = resultsList[indexPath.row]
        
        cell.textLabel?.text = list.name
        cell.detailTextLabel?.text = "\(list.tasks.count) Tasks"
        
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (_, index) -> Void in
            
          self.displayAlertToAddTaskList(self.resultsList[index.row])
        }
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete") { (_, index) -> Void in
           try!  uiRealm.write({ () -> Void in
               uiRealm.delete(self.resultsList[index.row])
                self.updateUI()
             })
            
            
        }
        
        
        return [deleteAction,editAction]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("openTasks", sender: self.resultsList[indexPath.row])
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let tasksViewController = segue.destinationViewController as! TasksViewController
        tasksViewController.selectedList = sender as! TaskList
    }
    
    
    @IBAction func Sorted(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
                self.resultsList =  self.resultsList.sorted("name",ascending: true )

           
        }else{
           
               self.resultsList = self.resultsList.sorted("createdAt")
      
        }
         self.taskListsTableView.reloadData()
        
    }
    
}
