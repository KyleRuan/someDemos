//
//  SocialBaseViewController.swift
//  网易主界面
//
//  Created by Jason on 16/7/5.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class SocialBaseViewController: BaseTableViewController {
//      var titles: String?
  
  override init(style: UITableViewStyle) {
    super.init(style: style)
  }
  convenience init(title:String) {
    self.init(style: UITableViewStyle.Plain)
      self.title = title
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.title = titles
        // Do any additional setup after loading the view.
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
