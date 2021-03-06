//
//  KRHallViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRHallViewController: UITableViewController {
  var messageView:KRMessageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let  image = UIImage.renderOriginlImage("CS50_activity_image")
    let left = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KRHallViewController.activity))
    self.navigationItem.leftBarButtonItem = left
    
    
    
    let rightImage = UIImage.renderOriginlImage("Development")
    let right = UIBarButtonItem(image: rightImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KRHallViewController.development))
    self.navigationItem.rightBarButtonItem = right
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    
    let items1 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    //     let items2 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    //     let items3 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    //     let items4 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    //     let items5 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    //     let items6 =   RKMessageItemModel(title: "", image: UIImage(named: "Development")!)
    let items = [items1,items1,items1,items1,items1,items1]
    
     messageView = KRMessageView(items: items)
  }
  
  func activity()  {
    KRCoverContentView.content.show()
  }
  
  func development()  {
    messageView.popInView(self.view)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  
  /*
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
   
   // Configure the cell...
   
   return cell
   }
   */
  
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
