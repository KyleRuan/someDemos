//
//  SettingSectionOneItem.swift
//  Lottery
//
//  Created by Jason on 16/6/30.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

enum KRSettingCellType {
  case None
  case Arrow
  case Switch
}

struct KRSettingItem {
  var title:String?
  var detailText:String?
  var image:UIImage?
  
  
  var cellOperation:(()->())?
  
  var cellType:KRSettingCellType = .None
  
  init(title:String?,detailText: String?, image: UIImage?,cellOperation: (()->())?) {
    self.title = title
    self.detailText = detailText
    self.image = image
    self.cellOperation = cellOperation
  }
 
}
