//
//  KRSettingViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/30.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRSettingViewController: UITableViewController {
  // section 的数组
  
  lazy var dataSource:Array<KRSettingSectionGroup> = {
    return []
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "设置"
    self.tableView.registerClass(KRSettingViewCell.self, forCellReuseIdentifier: Constants.CellReuseIdentifier.settingCell)
    setUpSection1()
    setUpSection2()
    setUpSection3()
    
  }
  
  override init(style: UITableViewStyle) {
    super.init(style: style)
  }
  
  
  convenience init() {
    
    self.init(style:UITableViewStyle.Grouped)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return  dataSource.count
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return  dataSource[section].groups.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellReuseIdentifier.settingCell, forIndexPath: indexPath)  as! KRSettingViewCell
    let item = dataSource[indexPath.section].groups[indexPath.row]
    cell.item = item
    return cell
  }
  
  
  
  override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return  dataSource[section].sectionFooter
  }
  
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return  dataSource[section].sectionHeader
  }
  
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let item = dataSource[indexPath.section]
    if let operation = item.groups[indexPath.row].cellOperation {
      operation()
    }
  }
  
  
  func setUpSection1()  {
  
    let operation = {
  
    }
    var item1 = KRSettingItem(title: "使用兑换券", detailText: nil, image: UIImage(named: "RedeemCode"),cellOperation: operation)
//    item1.cellType =  .Arrow
    
    var item2 = KRSettingItem(title: "帮助", detailText: nil, image: UIImage(named: "RedeemCode"),cellOperation: operation)
    item2.cellType =  .Arrow
    
    item2.cellOperation = {
      // push to the help View 
       let helpVC = KRHelpViewController()
       helpVC.title = "帮助"
      self.navigationController?.pushViewController(helpVC, animated: true)
    }
    
    let group1 = KRSettingSectionGroup(groups: [item1,item2], sectionHeader: nil, sectionFooter: nil)
    
    dataSource.append(group1)
    
  }
  
  func setUpSection2()  {
    //    (title: , nil,image:
    let item2 = KRSettingItem(title: "使用兑换券", detailText: nil, image: UIImage(named: "RedeemCode"),cellOperation: nil)
    
    var  item3 = KRSettingItem(title: "使用兑换券", detailText: nil, image: UIImage(named: "RedeemCode"),cellOperation: nil)
    item3.cellType = KRSettingCellType.Switch
    var group2 = KRSettingSectionGroup(groups: [item3,item3,item2,item2], sectionHeader: "Group2", sectionFooter: nil)
    
    group2.sectionFooter = "那你需要知道的是我的，而你却不知道，嗯是我不是你"
    group2.sectionHeader = "你我"
    
    dataSource.append(group2)
    
  }
  
  func setUpSection3()  {
    //    (title: , nil,image:
    let item3 = KRSettingItem(title: "使用兑换券", detailText: nil, image: UIImage(named: "RedeemCode"),cellOperation: nil)
    
    let group3 = KRSettingSectionGroup(groups: [item3,item3,item3,item3], sectionHeader: nil, sectionFooter: nil)
    dataSource.append(group3)
    
  }
  
  
  
  
}
