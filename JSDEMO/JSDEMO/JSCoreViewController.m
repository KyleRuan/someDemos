//
//  JSCoreViewController.m
//  JSDEMO
//
//  Created by KyleRuan on 2017/4/11.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "JSCoreViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "JSExportModel.h"
@interface JSCoreViewController ()
@property(nonatomic,strong)JSContext *context;
@property(nonatomic,strong)JSValue *jsValue;
@property(nonatomic,strong)JSManagedValue *managedValue;

@property (nonatomic, strong) JSExportModel *obj;
@end

@implementation JSCoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [[JSContext alloc] init];
    self.obj = [JSExportModel new];
    // 这里处理了所有的错误处理
    self.context.exceptionHandler =  ^(JSContext *context, JSValue *exception) {
        NSLog(@"exception---%@",exception);
    };
    [self excuteJSCode];
}

//jsfile
-(void)jsString{
    NSString *js = @"function add(a,b) {return a+b}";
    [self.context evaluateScript:js]; //
    JSValue *n = [self.context[@"add"] callWithArguments:@[@2, @3]];
    NSLog(@"---%@", @([n toInt32]));//---5
}


// OC执行JS代码
-(void)excuteJSCode{
    // read from disk or from server
    NSString *jsCode = [self readFile]; // jscore.js
    [self.context evaluateScript:jsCode];
    JSValue *min = [self.context[@"min"] callWithArguments:@[@2,@4]];
    JSValue *jsVar = self.context[@"jsGlobleVar"];
    NSLog(@"jsGlobleVar-----%@",[jsVar toString]);
    NSLog(@"min-----+++%d",[min toInt32]);
    
}

// JS调用OC: block
-(void)excuteOCBlockInJS{
    self.context[@"multi"]  = ^(NSInteger a,NSInteger b){
        return a*b;
    };
    JSValue *multi  = [self.context[@"multi"] callWithArguments:@[@3,@4]];

    NSLog(@"multiple-----%d",[multi toInt32]);
    //    或者
    multi = [self.context evaluateScript:@"multi(10,2)"];
     NSLog(@"evaluateScript-----%d",[multi toInt32]);
}

// JS调用OC：传入一个oc对象
-(void)excuteOCCdoeInJS{
    NSString *jsCode = [self readFile]; // jscore.js
    [self.context evaluateScript:jsCode];
    JSExportModel *model = [JSExportModel new];
    self.context[@"model"] = model;
    [self.context[@"useOCObject"] callWithArguments:nil];
    NSLog(@"%ld",(long)model.intV);
}


// JS调用OC：传入一个类对象
-(void)excuteOCClassInJS{
    NSString *jsCode = [self readFile]; // jscore.js
    [self.context evaluateScript:jsCode];
    self.context[@"Model"] = [JSExportModel class];
   JSValue *returned = [self.context[@"useOCClass"] callWithArguments:nil];
   JSExportModel *m= [returned toObjectOfClass:[JSExportModel class]];
    NSLog(@"%ld",(long)m.intV);
  
}

//JS调用OC 返回一个js函数并执行
-(void)jsReturnBlock{
    [self executeJS];
    //    self.obj.jsValue = [self.context[@"jsFunc"] callWithArguments:nil];
    //    [ self.obj.jsValue callWithArguments:nil];
    
    self.context[@"Obj"] = self.obj;
    [self.context[@"jsFunc"] callWithArguments:nil];
    [ self.obj.jsValue callWithArguments:nil];
    
}

// 内存管理
/**
 * js对象一直是被强引用的，靠js内部的（virtualMechine）垃圾回收来内存管理的
 **/

//block
-(void)jsRetainObjInBlock{
    //1 . 这里的block  捕获的的对象都会存到js环境中去，context本身属于self，所以造成retain cycle
  self.jsValue = [JSValue new];
    self.context[@"block"] = ^(){
        JSValue *value = self.jsValue;
        NSLog(@"%@",value);
    };
    
}

// get JSContext from UIWebView instance
// UIWebview
//JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

-(void)dealloc{
    NSLog(@"dead......");
}


//MARK: - Helper
- (NSString*)readFile{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jscore" ofType:@"js"];
    NSString * jsFile =  [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsFile;
}

- (void)executeJS{
    NSString *file = [self readFile];
    [self.context evaluateScript:file];
    
}

@end
