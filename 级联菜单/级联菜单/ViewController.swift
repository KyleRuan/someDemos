//
//  ViewController.swift
//  级联菜单
//
//  Created by Jason on 16/7/3.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  @IBOutlet weak var category: UITableView!
  
  @IBOutlet weak var subCategory: UITableView!
  lazy var items:Array<Items>  = {
    let path = NSBundle.mainBundle().pathForResource("categories.plist", ofType: nil)
    let arr = NSArray(contentsOfFile: path!)
    
    let items = arr?.flatMap({ (dic) -> Items? in
      guard let icon = dic["icon"] as? String ,  name = dic["name"] as? String,  highlighted_icon = dic["highlighted_icon"] as? String,  subcategories = dic["subcategories"] as? Array<String> else{
        return nil
      }
      let one = Items(highlighted_icon: highlighted_icon, icon: icon, name: name, subcategories: subcategories)
      return one
    })
    
    return items!
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
//    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
//  }
    
    print(category.indexPathForSelectedRow)
   
  }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let index = NSIndexPath(forRow: 1, inSection: 0)
    category.selectRowAtIndexPath(index, animated: true, scrollPosition: .Top)
    
    
    subCategory.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    
    self.tableView(category, didSelectRowAtIndexPath: index)
    //     [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]]
    print(category.indexPathsForSelectedRows)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == category {
       return  items.count
    } else {
      guard  let row = category.indexPathForSelectedRow?.row else {
        return 1
      }
      return items[row].subcategories.count
    }
    
   
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    if tableView == self.category {
      let cell = tableView.dequeueReusableCellWithIdentifier("category")!
      cell.textLabel?.text = "\(items[indexPath.row].name)"
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
      cell.textLabel?.highlightedTextColor = UIColor.greenColor()
      return cell
    } else {
      let cell = tableView.dequeueReusableCellWithIdentifier("subCategories", forIndexPath: indexPath)
      
      guard  let row = category.indexPathForSelectedRow?.row else {
        return cell
      }
      cell.textLabel?.text = "\(items[row].subcategories[indexPath.row])"
      cell.textLabel?.highlightedTextColor = UIColor.redColor()
      return cell
    }
 
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     // 选中那一行
//    print(category.)
    if tableView == category {
//       category.reloadData()
      subCategory.reloadData()
    }
    
    
  }
  
  
  
  


}

