//
//  itemView.swift
//  loadingVIEW
//
//  Created by Jason on 16/6/27.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class itemView: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  let percent:CGFloat = 0.8
  override func layoutSubviews() {
    // 
    guard let imageView = self.imageView , let title = self.titleLabel else {
      return
    }
    let imageHeight = self.frame.height*percent
    imageView.frame = CGRectMake(0, 0, self.frame.width, imageHeight)
    let titleHeght = self.frame.height*(1-percent)
    title.frame = CGRectMake(0, imageHeight, self.frame.width, titleHeght)
    self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    imageView.contentMode = .Center
    titleLabel?.textAlignment = .Center
    
  }

}
