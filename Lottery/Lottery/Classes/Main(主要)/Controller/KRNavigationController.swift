//
//  KRNavigationController.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRNavigationController: UINavigationController,UINavigationControllerDelegate {

  
  
  
  override class func initialize() {
    
    let navBar = UINavigationBar.appearanceWhenContainedInInstancesOfClasses([self])
    print("KRNavigationController")
    navBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
    
    var dic:Dictionary<String,AnyObject> = [:]
    dic[NSForegroundColorAttributeName] = UIColor.whiteColor()
    dic[NSFontAttributeName] = UIFont.boldSystemFontOfSize(20)
    
    navBar.titleTextAttributes = dic
  }
  
  var popGesture: UIGestureRecognizerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.delegate = self
      popGesture = self.interactivePopGestureRecognizer?.delegate
        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
     self.interactivePopGestureRecognizer?.delegate = nil
  }
  
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillAppear(animated)
 
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  
//  override func pushViewController(
  override func pushViewController(viewController: UIViewController, animated: Bool) {
    if (self.viewControllers.count != 0) { // 非跟控制器hi
      viewController.hidesBottomBarWhenPushed = true;
      
      // 设置导航条左边按钮的内容,把系统的返回按钮给覆盖,导航控制器的滑动返回功能就木有啦
    
      let leftItem = UIBarButtonItem(image: UIImage(named: "NavBack"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KRNavigationController.back))
      
      viewController.navigationItem.leftBarButtonItem = leftItem
      
    }

    
    
    super.pushViewController(viewController, animated: animated)
  }
  
  func back()  {
    self.popViewControllerAnimated(true)
  }
  
  
  
  func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
       self.interactivePopGestureRecognizer?.delegate = popGesture
    if self.viewControllers.count > 1 {
      // 非更目录
      
    }
    
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
