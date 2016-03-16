//
//  ViewController.swift
//  Conversation
//
//  Created by Jason on 16/3/16.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let testString =["name:""weixing"]
    var resultDic:[[String:String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let dict1 = ["name":"lover","content":"d"]
        let dict2 = ["name":"me","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检dddddddddddddddddddddddddddddddddddddddddddddddddddddd"]
        let dict3 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
        let dict4 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
        let dict5 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
    
        
         resultDic = [dict1,dict2,dict3,dict4,dict5]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let fontOfSize:CGFloat = 40
    let  screenWidth = UIScreen.mainScreen().bounds.width
    func bubbleView(text:String,ISME:Bool,position:CGFloat)->UIView{
        let font  = UIFont.systemFontOfSize(fontOfSize)//可以是控件的字体获取一下
        //出现和背景出了屏幕跳转最大的width
        let sizeMax = CGSizeMake(screenWidth-position-40, 2000)
        
        let arr = [NSFontAttributeName:font]
        //        NSLineBreakByWordWrapping
        
        let size = (text as NSString).boundingRectWithSize(sizeMax, options: [NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: arr, context: nil).size
        
        let returnView = UIView()
        returnView.backgroundColor = UIColor.clearColor()
        
        let bubble = UIImage(named: (ISME ? "SenderAppNodeBkg_HL":"ReceiverTextNodeBkg"))
        
        let left = (bubble!.size.width/2)
        let top =  (bubble!.size.height/2)
        let image = bubble?.resizableImageWithCapInsets(UIEdgeInsets(top: top, left: left, bottom: bubble!.size.height, right: bubble!.size.width))
        let bubbleImageView = UIImageView.init(image: image)
       
        
        
        let textLabel = UILabel(frame:CGRectMake(ISME ? 15.0:22.0, 20.0, size.width+10, size.height+10))
        
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.font = font
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .ByWordWrapping
        textLabel.text = text
        
        bubbleImageView.frame = CGRectMake(0.0, 14.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+20)
        if(ISME){
            returnView.frame = CGRectMake(screenWidth-position - (textLabel.frame.size.width+30.0), 0.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+30.0)
        }else{
            returnView.frame = CGRectMake(position, 0.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+30.0)
        }
        
        returnView.addSubview(bubbleImageView)
        returnView.addSubview(textLabel)
        
        
        return returnView
        
        
        
        
    }


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultDic.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         var  cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
        }else{
            for cellView in (cell?.subviews)! {
                cellView.removeFromSuperview()
        }
        }
        
        //是左还是右
        let dict = resultDic[indexPath.row]
        
        if dict["name"] == "lover"{
            let avatar = UIImage(named: "photo")
        let imageview = UIImageView(frame: CGRectMake(10, 10, 50, 50))
            imageview.image = avatar
            cell?.addSubview(imageview)
        }else{
                let avatar = UIImage(named: "photo1")
                let imageview = UIImageView(frame: CGRectMake(screenWidth-60, 10, 50, 50))
                imageview.image = avatar
                cell?.addSubview(imageview)
            
        }
        
        //如果是text 
      
        cell!.addSubview(self.bubbleView(dict["content"]!,ISME: dict["name"] == "me" ,position:65))
        
        return cell!
    }


    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
          let  dict  = resultDic[indexPath.row]
          let font  = UIFont.systemFontOfSize(fontOfSize)//可以是控件的字体获取一下
        
        let sizeMax = CGSizeMake(screenWidth-65-30, 2000)
        
        let arr = [NSFontAttributeName:font]
        
        let size = (dict["content"]! as NSString).boundingRectWithSize(sizeMax, options: [NSStringDrawingOptions.TruncatesLastVisibleLine ,NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: arr, context: nil).size
        return size.height+44
    }
    
    
    


}
