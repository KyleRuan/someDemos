//
//  JSCoreWKController.m
//  JSDEMO
//
//  Created by KyleRuan on 2017/4/14.
//  Copyright © 2017年 kyle. All rights reserved.
//

#import "JSCoreWKController.h"
#import <WebKit/WebKit.h>

@interface JSCoreWKController ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,strong)WKWebView *web;

@end

@implementation JSCoreWKController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration * config  = [self configWebView];
    _web = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
   
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"wkDemo" withExtension:@"html"];
     [self.view addSubview:_web];
    [_web loadRequest: [NSURLRequest requestWithURL:path]];
    
    _web.UIDelegate = self;
    _web.navigationDelegate = self;
//    WKErrorDomain
    [_web addObserver:self
                   forKeyPath:@"loading"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [_web addObserver:self
                   forKeyPath:@"title"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    [_web addObserver:self
                   forKeyPath:@"estimatedProgress"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"loading"]) {
        NSLog(@"loading");
    } else if ([keyPath isEqualToString:@"title"]) {
        self.title = self.web.title;
    } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
        NSLog(@"progress: %f", self.web.estimatedProgress);
    }
    
    
    // 加载完成
    if (!self.web.loading) {
        // 手动调用JS代码
        NSString *js = @"showWebViewAlert()";
        [self.web evaluateJavaScript:js completionHandler:^(id _Nullable response, NSError * _Nullable error) {
            NSLog(@"response: %@ error: %@", response, error);
        }];
    }
}

-(void)dealloc{
    NSLog(@"%s",__FUNCTION__);
}
// 配置
-( WKWebViewConfiguration *)configWebView{
    WKWebViewConfiguration * config = [WKWebViewConfiguration new];
//    WKWebViewConfiguration 三种配置
    config.preferences = [WKPreferences new];
    // 默认为0
    config.preferences.minimumFontSize = 10;
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    
    config.processPool = [[WKProcessPool alloc] init];
    
    WKUserContentController *contentVC = [WKUserContentController new];
    //可以在WKScriptMessageHandler代理中接收到
    [contentVC addScriptMessageHandler:self name:@"AppModel"];
    config.userContentController = contentVC;
    
    return config;
}

  #pragma mark - WKUIDelegate

-(void)webViewDidClose:(WKWebView *)webView{
    NSLog(@"%s", __FUNCTION__);
}

// 在JS端调用alert函数时，会触发此代理方法。alert conform input panel.
// JS端调用alert时所传的数据可以通过message拿到
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    // message 就是alert上的message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:@"JS调用alert"                 preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 这个completionHandler是alert后面的代码
        // window.webkit.messageHandlers.AppModel.postMessage({body: 'call js alert in js'});
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}



// MARK: - WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    // 收到消息
     // window.webkit.messageHandlers.AppModel.postMessage({body: 'call js alert in js'});
    NSLog(@"%@",message.body);
}


// MARK: - WKNavigationDelegate
//  链接跳转、接收响应、在导航开始、成功、失败等时要做些处理

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
      NSString *hostname = navigationAction.request.URL.host.lowercaseString;
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated
        && ![hostname containsString:@".baidu.com"]) {
        // 对于跨域，需要手动跳转
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
     
        // 不允许web内跳转
        decisionHandler(WKNavigationActionPolicyCancel);
    }else {
        // 允许web内跳转
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
    NSLog(@"%s", __FUNCTION__);
}


// 如果设置为不允许响应，web内容就不会传过来
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
    NSLog(@"%s", __FUNCTION__);
}

// 开始导航跳转时会回调
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
}

// 接收到重定向时会回调
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
}

// 导航失败时会回调
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}



// 对于HTTPS的都会触发此代理，如果不要求验证，传默认就行
// 如果需要证书验证，与使用AFN进行HTTPS证书验证是一样的
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *__nullable credential))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, nil);
}

// 9.0才能使用，web内容处理中断时会触发
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    NSLog(@"%s", __FUNCTION__);
}



@end
