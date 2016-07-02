//
//  KRLuckyViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRLuckyViewController: UIViewController {
  @IBOutlet weak var lights: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let image1 = UIImage(named: "lucky_entry_light0")!
      let  image2 = UIImage(named: "lucky_entry_light1")!
      lights.animationImages = [image1,image2]
      lights.animationDuration = 1
      lights.startAnimating()
      self.title = "幸运选号"
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    // 把隐藏的操作fnavigation里面了可以看 KRNavigationContoller
     self.tabBarController?.tabBar.hidden = true 
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    
    self.tabBarController?.tabBar.hidden = false
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
