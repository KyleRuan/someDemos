//
//  KRSettingViewCell.swift
//  Lottery
//
//  Created by Jason on 16/6/30.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit
class KRSettingViewCell: UITableViewCell {

  lazy var arrowView:UIImageView = {
    let arrow = UIImage(named: "arrow_right")
    let view = UIImageView(image: arrow)
    return view
  }()
  
  lazy var switchView:UISwitch = {
    return UISwitch()
  }()
  
  var item:KRSettingItem!{
    didSet {
      configCell()
    }
    
//    return SettingSectionItem()
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configCell()  {
    self.imageView?.image =  item.image
    self.textLabel?.text = item.title
    self.detailTextLabel?.text = item.detailText
    self.selectionStyle = .None
    if  item.cellType == .Arrow  {
      self.accessoryView = arrowView
      self.selectionStyle = .Default
    } else if item.cellType == .Switch {
      self.accessoryView =  switchView
      
    }
    
  }
  
  
}
