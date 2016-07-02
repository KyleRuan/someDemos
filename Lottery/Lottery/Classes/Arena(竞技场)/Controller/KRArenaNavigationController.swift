//
//  KRArenaNavigationController.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRArenaNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override class func initialize() {
        let nav = UINavigationBar.appearanceWhenContainedInInstancesOfClasses([self])
          nav.setBackgroundImage(UIImage(named: "NLArenaNavBar64"), forBarMetrics: UIBarMetrics.Default)
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
