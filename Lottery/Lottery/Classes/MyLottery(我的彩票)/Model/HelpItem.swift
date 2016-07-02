//
//  HelpItem.swift
//  Lottery
//
//  Created by Jason on 16/7/1.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import Foundation



struct HelpItem {
  var title:String?
  var html:String?
  var id :String?
  init(dic:Dictionary<String,String>) {
    // 这里使用了Struct，所以不能使用了 OC的键值方法，所以采取了最笨的方法
    
    
    
    title = dic["title"]
    html = dic["html"]
    id = dic["id"]
    
    
    
  }
  
  
  
  // "title" : "如何提现？",
  //  "html" : "help.html",
  //  "id" : "howtowithdraw"
  
}
