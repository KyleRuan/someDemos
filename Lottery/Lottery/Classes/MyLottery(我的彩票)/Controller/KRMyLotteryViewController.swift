//
//  KRMyLotteryViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRMyLotteryViewController: UIViewController {
  
  @IBOutlet weak var loginBTN: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let imageBG = loginBTN.currentBackgroundImage {
      let insets = UIEdgeInsets(top: imageBG.size.height * 0.2, left: imageBG.size.width*0.2, bottom: imageBG.size.height * 0.2, right: imageBG.size.width*0.2)
      let image  = imageBG.resizableImageWithCapInsets(insets)
      loginBTN.setBackgroundImage(image, forState: UIControlState.Normal)
    }
    let image = UIImage.renderOriginlImage("FBMM_Barbutton")
    let leftButton = UIButton(type: .Custom)
    leftButton.setImage(image, forState: UIControlState.Normal)
    leftButton.setTitle("客服", forState: .Normal)
    leftButton.sizeToFit()
    //      rightView.addSubview(image)
    leftButton.addTarget(self, action: #selector(KRMyLotteryViewController.serverMM), forControlEvents: .TouchUpInside)
    
    let left = UIBarButtonItem(customView: leftButton)
    
    
    self.navigationItem.leftBarButtonItem = left
    
    
    let settingImage = UIImage.renderOriginlImage("Mylottery_config")
    let right = UIBarButtonItem(image: settingImage, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(KRMyLotteryViewController.myConfig))
    
    
    self.navigationItem.rightBarButtonItem = right
    
    // Do any additional setup after loading the view.
  }
  
  func serverMM()  {
    //
    print("KRMyLotteryViewController+serverMM")
  }
  
  func myConfig()  {
    let vc = KRSettingViewController()
     self.navigationController?.pushViewController(vc, animated: true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func back()  {
    // back 
    
    self.navigationController?.popViewControllerAnimated(true)
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
