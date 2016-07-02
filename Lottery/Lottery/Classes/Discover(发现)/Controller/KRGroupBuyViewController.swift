//
//  KRGroupBuyViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRGroupBuyViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    //       self.title = "wo de "
    
    
    // Do any additional setup after loading the view.
  }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    let button = KRGruopBuyButton(type: .Custom)
    button.setTitle("合买", forState: UIControlState.Normal)
    button.setImage(UIImage(named: "YellowDownArrow"), forState: UIControlState.Normal)
    button.sizeToFit()
    
    
    self.navigationItem.titleView = button
    

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
