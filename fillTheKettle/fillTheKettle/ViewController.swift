//
//  ViewController.swift
//  fillTheKettle
//
//  Created by Jason on 16/2/23.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var mask = MaskView(frame: CGRectMake(0,0,104,157))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mask)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startAnimation(sender: AnyObject) {
        mask.startAnimation()
    }
    
    
    @IBAction func pauseAnimaiton() {
        mask.pauseAnimation()
    }
 

    @IBAction func resumeAnimation() {
        mask.resumeAnimation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

