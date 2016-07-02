//
//  KRGruopBuyButton.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRGruopBuyButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  override func layoutSubviews() {
     super.layoutSubviews()
    
    if (self.imageView?.frame.origin.x < self.titleLabel?.frame.origin.x) {
      
      self.titleLabel?.frame.origin.x = (self.imageView?.frame.origin.x)!;
      
      self.imageView!.frame.origin.x = CGRectGetMaxX(self.titleLabel!.frame);
    }

    
  }
//  
//  override func setTitle(title: String?, forState state: UIControlState) {
//    super.setTitle(title, forState: UIControlState.Normal)
//    self.sizeToFit()
//  }
//  
//  override func setImage(image: UIImage?, forState state: UIControlState) {
//    super.setImage(image, forState: UIControlState.Normal)
//    self.sizeToFit()
//  }

}
