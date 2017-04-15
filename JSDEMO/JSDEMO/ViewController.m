//
//  ViewController.m
//  JSDEMO
//
//  Created by kyle on 2017/3/31.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)JSContext *context;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _webView = [UIWebView new];
    _webView.frame = self.view.frame;
    [self.view addSubview:_webView];
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"webDemo" ofType:@".html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
 
}

// 当页面加载完毕的时候，就可以调用js程序
-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [_webView stringByEvaluatingJavaScriptFromString:@"alert('webViewDidFinishLoad')"];
     _context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [_context evaluateScript:@"showWebViewAlert()"];
    
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString * url = request.URL.absoluteString;
    if ([url hasPrefix:@"ios://"]) {
        NSString *host =   request.URL.host;
        if ([host isEqual:@"alert"]) {
            NSString *msg = [request.URL.query componentsSeparatedByString:@"="].lastObject;
            if (msg) {
                [self showAlertWithMessage:msg];
            }
        } else if ([host isEqualToString:@"share"]) {
            NSString *msg = request.URL.path.lastPathComponent ;
            if (msg) {
                [self showAlertWithMessage:msg];
            }
        }
        
        return NO;
    }
    return YES;
}

- (void)showAlertWithMessage:(NSString*)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:true completion:nil];
    
}


@end
