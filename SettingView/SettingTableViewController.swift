//
//  SettingTableViewController.swift
//  SettingView
//
//  Created by Jason on 5/22/16.
//  Copyright © 2016 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var avatar:avatarView!
    
    var height:CGFloat =  160

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame  =  CGRectMake(0, -height, UIScreen.mainScreen().bounds.width, height)
        avatar = avatarView(frame: frame,backgroundImage: UIImage(named: "kobe")!, avatarImage: UIImage(named: "BGimage")!)
        avatar.avatar = UIImage(named: "IMG")
        avatar.backgroundColor  = UIColor.greenColor()
        tableView.addSubview(avatar)
        tableView.contentInset = UIEdgeInsetsMake(height, 0, 0, 0)
 
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
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }

    
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        // 开始缩放的条件是大于height的时候
        if scrollView.contentOffset.y <  -height {
            // 设置scale
            let scale = abs(scrollView.contentOffset.y/height)
            self.avatar.layer.position = CGPointMake(UIScreen.mainScreen().bounds.width/2.0, scrollView.contentOffset.y / 2.0)
            avatar.transform = CGAffineTransformMakeScale(scale, scale)
            //          CGAffineTransformScale(avatar.transform, scale, scale)
            //触发放大缩小
            
//            self.view.transform = CGAffineTransformMakeScale(scale, scale);
            
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
