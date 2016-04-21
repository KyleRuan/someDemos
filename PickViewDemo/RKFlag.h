//
//  RKFlag.h
//  PickViewDemo
//
//  Created by Jason on 16/4/21.
//  Copyright © 2016年 com.io.github.kyleruan. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>



@interface RKFlag : NSObject

@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)UIImage *icon;

+(instancetype)flagWithDic:(NSDictionary*)dic ;

@end
