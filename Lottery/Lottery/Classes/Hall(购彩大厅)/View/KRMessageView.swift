//
//  KRMessageView.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

enum MessageViewState {
  case showing
  case close
}


class KRMessageView: UIView {
  
  //  计算高度
  // items 的个数
  // items的大小
  //
  private let cols = Constants.KRMessageView.cols
    private let  itemWidth = Constants.KRMessageView.itemWidth
  var items:Array<RKMessageItemModel>!
  var rows:CGFloat!
  var state = MessageViewState.close
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(items:Array<RKMessageItemModel>) {
    
    let rows = CGFloat(items.count/Constants.KRMessageView.cols)
    let height =  Constants.KRMessageView.itemWidth*rows
    let frame =  CGRectMake(0, 0, Constants.windowWidth, height)
    self.init(frame:frame)
    self.items = items
    self.rows = rows
    self.backgroundColor = UIColor.blackColor()
    self.setUpButton()
    self.setDivideLine()
  }
  
  override func layoutSubviews() {
    //
    super.layoutSubviews()
    var i = 0
    for view in self.subviews where view is UIButton {
      // layout subViews
      let col = CGFloat(i%cols)
      let row = CGFloat(i/cols)
      view.frame = CGRectMake(col*itemWidth, row*itemWidth, itemWidth, itemWidth)
      i = i+1
    }
  }
  
  private func setUpButton()  {
    
    for item in items {
      // item
      let btn  = UIButton(type: .Custom)
      btn.setImage(item.image, forState: UIControlState.Normal)
      btn.setTitle(item.title, forState: UIControlState.Normal)
      btn.sizeToFit()
      self.addSubview(btn)
    }
  }
  func popInView(view:UIView)  {
    //
    
    
    if state == .close {
      
      view.addSubview(self)
      self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.height)
      
      UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
        self.transform = CGAffineTransformIdentity
      }) { (success) in
        //
        self.state = .showing
      }
    } else {
      UIView.animateWithDuration(0.5, animations: {
         self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.height)
        }, completion: { (success) in
          self.removeFromSuperview()
          self.state = .close
      })
     
    }
  }
  
  func setDivideLine() {
    // 横竖线
//    itemWidth
    
    for i in 1..<cols {
      //
      let frame = CGRectMake(CGFloat(i)*itemWidth, 0, 1, self.bounds.height)
      let view = UIView(frame: frame)
      view.backgroundColor = UIColor.whiteColor()
      self.addSubview(view)
      
    }
    
    for i in 1..<Int(rows) {
      let frame = CGRectMake(0, CGFloat(i)*itemWidth, self.bounds.width, 1)
      let view = UIView(frame: frame)
      view.backgroundColor = UIColor.whiteColor()
      self.addSubview(view)

    }
    
  }
  
}
