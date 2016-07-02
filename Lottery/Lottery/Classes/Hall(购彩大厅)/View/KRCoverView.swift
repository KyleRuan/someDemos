//
//  KRCoverView.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRCoverView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  static let coverView = KRCoverView(frame: Constants.bounds)
  
  override private init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.blackColor()
    self.alpha = 0.6
  }
  
  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
    self.init()
    //
  }
  
  
   func show(){
    Constants.keyWindow.addSubview(KRCoverView.coverView)
  }
  
  func hide()  {
    KRCoverView.coverView.removeFromSuperview()
  }
  
  
  

}
