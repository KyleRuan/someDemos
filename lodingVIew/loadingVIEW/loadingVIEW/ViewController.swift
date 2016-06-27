//
//  ViewController.swift
//  loadingVIEW
//
//  Created by Jason on 16/6/27.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var  items:Array<Item>!
  override func viewDidLoad() {
    super.viewDidLoad()
   let item1 = Item(title: "点评", imagePath: "tabbar_compose_review")
    let item2 = Item(title: "更多", imagePath: "tabbar_compose_more")
    let item3 = Item(title: "拍摄", imagePath: "tabbar_compose_camera")
    let item4 = Item(title: "文字", imagePath: "tabbar_compose_idea")
    let item5 = Item(title: "相册", imagePath: "tabbar_compose_photo")
    let item6 = Item(title: "签到", imagePath: "tabbar_compose_review")

    
    items = [item1,item2,item3,item4,item5,item6]
  
   
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func showItems(sender: AnyObject) {
    let vc = ComponnetViewController()
     vc.items = items
    vc.view.frame = self.view.frame
   
    self.presentViewController(vc, animated: true, completion: nil)
  }
}

