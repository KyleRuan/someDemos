//
//  KRArenaViewController.swift
//  Lottery
//
//  Created by Jason on 16/6/28.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRArenaViewController: UIViewController {

  override func loadView() {
    //
    let imageView = UIImageView(image: UIImage(named: "NLArenaBackground"))
    
    self.view = imageView
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
   let items = ["足球","篮球"]
      let seg = UISegmentedControl(items: items)
      
      seg.bounds.size.width += 40
      let segBG = UIImage.renderOriginlImage("CPArenaSegmentBG")
      seg.setBackgroundImage(segBG, forState: .Normal, barMetrics: UIBarMetrics.Default)
      
      let segSelectedBg = UIImage.renderOriginlImage("CPArenaSegmentSelectedBG")
           seg.setBackgroundImage(segSelectedBg, forState: .Selected, barMetrics: UIBarMetrics.Default)
      
      self.navigationItem.titleView = seg


    
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
