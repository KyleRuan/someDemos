//
//  KRTabBarView.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

protocol KRTabBarViewDelegate {
  func selectedButtonAtIndex(selectedIndex:Int)
}

class KRTabBarView: UIView {
  var delegate:KRTabBarViewDelegate?
  var selectedIndex:Int = 0 {
    didSet {
      if let btn = self.subviews[selectedIndex] as? UIButton ,old = self.subviews[oldValue] as? UIButton  {
          old.selected = false
          btn.selected = true
          delegate?.selectedButtonAtIndex(selectedIndex)
      }
    }
  }
  var items:Array<SubControllerItem>!{
    didSet {
      items.forEach({ (item) in
        let button = KRTabBarButton(type: UIButtonType.Custom)
        button.setImage(item.tabBarImage, forState: .Normal)
        button.setImage(item.selectedImage, forState: UIControlState.Selected)
        button.tag = self.subviews.count
        button.addTarget(self, action: #selector(KRTabBarView.selected(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)
      })
      if items.count>0 {
        selectedIndex = 0
      }
    }
  }

//  private var size:CGSize!
  override func layoutSubviews() {
    var x :CGFloat = 0
    let w =  UIScreen.mainScreen().bounds.width/CGFloat(self.subviews.count)
    for button in self.subviews where button is UIButton {
        button.frame = CGRectMake(x, 0, w,self.bounds.height)
        x = x + button.frame.width
    }
  }
  
  func selected(btn:UIButton)  {
    if selectedIndex != btn.tag {
      selectedIndex = btn.tag
    }
  }
  
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}



