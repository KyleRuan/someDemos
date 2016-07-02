//
//  Constants.swift
//  Lottery
//
//  Created by Jason on 16/6/29.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit


struct Constants {
  static var keyWindow:UIWindow!{
    get {
      if let window = UIApplication.sharedApplication().keyWindow  {
        return  window
      }
      return nil
    }
    set{
      
    }
  }
  
  
  
  static let bounds = UIScreen.mainScreen().bounds
  static let windowWidth = UIScreen.mainScreen().bounds.width
  
  
  struct KRMessageView {
    static let cols = 3
    static var itemWidth:CGFloat {
      return  Constants.windowWidth/CGFloat(Constants.KRMessageView.cols)
    }
  }
  
  
  
  struct AppInfo {
    static let appVersion = "APPVERSION"
  }
  
  
  struct CellReuseIdentifier {
    static let settingCell = "SettingCell"
  }
  
}