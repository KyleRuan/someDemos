//
//  KRNewFeatureViewCell.swift
//  Lottery
//
//  Created by Jason on 16/6/30.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRNewFeatureViewCell: UICollectionViewCell {
  
  var image:UIImage!{
    didSet {
      let imageView = UIImageView(frame: self.frame)
      imageView.image = image
      self.backgroundView  = imageView
    }
  }
  
  var isLast:Bool = false{
    didSet {
      if isLast == true {
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: "guideStart"), forState: UIControlState.Normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(KRNewFeatureViewCell.toMainScreen), forControlEvents: UIControlEvents.TouchUpInside)
        
        btn.center = CGPointMake(self.bounds.width*0.5, self.bounds.height*0.9)
        self.addSubview(btn)
        
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func toMainScreen()  {
    // 
    let window = Constants.keyWindow
    
    let tabVC = KRTabBarController()
    
    
    let tranAnimation = CATransition()
    
    tranAnimation.type = "fade"  //kCATransitionFromRight
    
    tranAnimation.duration = 0.5
    window.layer.addAnimation(tranAnimation, forKey: nil)
    
    
    window.rootViewController = tabVC
    
    
    
  }

  
  
}
