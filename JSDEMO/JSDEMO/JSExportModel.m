//
//  JSExportModel.m
//  JSDEMO
//
//  Created by KyleRuan on 2017/4/11.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "JSExportModel.h"

@implementation JSExportModel


@synthesize sum;
@synthesize intV;
@synthesize jsValue;
-(void)minuse:(NSInteger)a b:(NSInteger)b c:(NSInteger)c{
    NSLog(@"%ld",a-b-c);
}


-(void)block:(JSValue*)value{
    NSLog(@"------block");
    self.obj =value;
}

+(instancetype)createWithIntV:(NSInteger)value{
    
    JSExportModel *model = [JSExportModel new];
    model.intV = value;
    return model;
    
}
@end
