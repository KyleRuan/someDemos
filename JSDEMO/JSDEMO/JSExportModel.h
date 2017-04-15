//
//  JSExportModel.h
//  JSDEMO
//
//  Created by KyleRuan on 2017/4/11.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


//该协议规定哪些属性在 JavaScript 中可用。
@protocol JSModelProtocol <JSExport>
//JSExportAs(add, - (NSInteger)add:(NSInteger)a b:(NSInteger)b);用宏改方法名

-(void)minuse:(NSInteger)a b:(NSInteger)b c:(NSInteger)c;
// 这个会产生问题
-(void)block:(JSValue*)value;
@property (assign,nonatomic)NSInteger sum;
@property(nonatomic,assign)NSInteger intV;
@property(nonatomic,strong)JSValue *jsValue;
+(instancetype)createWithIntV:(NSInteger)value;

@end

// export JSExportModel class
//context[@"JSExportModel"] = [JSExportModel class]; 这样就可以在这个类中使用这个类了。
@interface JSExportModel : NSObject<JSModelProtocol>

@property(nonatomic,strong)JSContext *obj;
@end
