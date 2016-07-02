//
//  KRCoverContentView.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRCoverContentView: UIView {
  /// a SingleTon KRCoverContentView that you can add subView on it
  static let content = KRCoverContentView(frame: CGRectMake(0, 0, 100, 100))
  override private init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    
    self.init()
  }
  
  
  func show()  {
    
    // to delete
    let image = UIImageView(image: UIImage(named: "xiaopingguo"), highlightedImage: nil);
    KRCoverContentView.content.addSubview(image)
    
    
    var maxFrame = CGRectZero
    var maxSize:CGFloat = 0
    if KRCoverContentView.content.subviews.count>0 {
      for subView in KRCoverContentView.content.subviews {
        let size = subView.frame.width*subView.frame.height
        if size > maxSize {
          maxSize = size
          maxFrame = subView.frame
        }
      }
    }
    
    KRCoverContentView.content.frame = maxFrame
    KRCoverContentView.content.center = Constants.keyWindow.center
    // add the quit button
    let close = UIButton()
    let closeImage = UIImage(named: "alphaClose")
    close.setImage(closeImage, forState: UIControlState.Normal)
    close.sizeToFit()
    close.addTarget(self, action: #selector(KRCoverContentView.close), forControlEvents: UIControlEvents.TouchUpInside)
    let closeFrame = CGRectMake(maxFrame.width-close.bounds.width, 0, close.frame.width, close.frame.height)
    close.frame = closeFrame
    KRCoverContentView.content.addSubview(close)
    KRCoverView.coverView.show()
    Constants.keyWindow.addSubview(KRCoverContentView.content)
  }
  
  
  class func hideInPoint(point:CGPoint) {
    // 位置加大小
    let center = KRCoverContentView.content.center
    UIView.animateWithDuration(1, animations: {
      var  transform = CGAffineTransformIdentity
      transform = CGAffineTransformTranslate(transform,  -center.x + point.x, -center.y + point.y)
      transform = CGAffineTransformScale(transform, 0.1, 0.1)
      
      //      KRCoverContentView.transform = transform
      KRCoverContentView.content.transform = transform
    }) { (_) in
      KRCoverContentView.content.transform = CGAffineTransformIdentity
      KRCoverContentView.content.removeFromSuperview()
      KRCoverView.coverView.removeFromSuperview()
    }
    
  }
  func close()  {
    let point = CGPointMake(44, 44)
    KRCoverContentView.hideInPoint(point)
  }
  
  
  
}
