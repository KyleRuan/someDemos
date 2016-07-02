//
//  KRHelpHtmlViewController.swift
//  Lottery
//
//  Created by Jason on 16/7/1.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

import UIKit

class KRHelpHtmlViewController: UIViewController , UIWebViewDelegate{
  var  htmlName:String!
  
  override func loadView() {
    let webView = UIWebView(frame: Constants.bounds)
    self.view = webView
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let htmlPath = NSBundle.mainBundle().URLForResource(htmlName, withExtension: nil) else {
      return
    }
    let req = NSURLRequest(URL: htmlPath)
    guard let view = self.view as? UIWebView else {
      return
    }
    view.loadRequest(req)
    view.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func webViewDidFinishLoad(webView: UIWebView) {
   // to do something
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
