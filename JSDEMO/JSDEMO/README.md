# jsdemo
在如今大前端的浪潮下，hybrid其实已经很常见了。为了适应每天一变得内容，web比原生提供了更好的适用性。本系列文章通过如下三个方面来写oc和js之间的交互
1.  基于`UIWebView`和`WKWebView`
2. 基于`JavaScriptCore`
3. ，JSPatch和React-Native源码分析

本文是系列文章的第一篇，讲讲基于`UIWebView`和`WKWebView`
## 两种形式的交互

 1. 一种是UIWebView 和 WKWebview通过代理，截取点击事件
 2. JavaScriptCore进行交互。

### webView的代理
####  oc 调用js
```oc
// 当页面加载完毕的时候，就可以调用js程序
-(void)webViewDidFinishLoad:(UIWebView *)webView{
NSLog(@"%s",__func__);
[_webView stringByEvaluatingJavaScriptFromString:@"alert('webViewDidFinishLoad')"];
}
```
####  js调用oc
  从本地或者服务器获取html文件，使用`UIWebView`来加载。在之前的网易新闻客户端中，采用本地html模板，解析从服务器返回的json，来拼接正文页。通过webview的
`- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;`代理来监听webview的请求。自定义scheme，针对不同的scheme调用不同的oc原生方法。如下html和js代码

``` HTML
<!-- html -->
<img src='share_platform_qqfriends@2x.png' onclick="shareButtonDidClick()" class="imageSize"></img>
```

``` Javascript
// js
function shareButtonDidClick(element){
var href = "ios://share/WeChat";
location.href = href;
};
```

``` oc
//  oc
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
if ([host isEqualToString:@"share"]) {
            NSString *msg = request.URL.path.lastPathComponent ;
            if (msg) {
                [self showAlertWithMessage:msg];
            }
            return NO;
}
```
通过改变当前页的`location.href `属性，webview进行一次Request,在`StartLoadWithRequest`中监听，并从请求的url中获取获取scheme和一些参数，进行oc方法调用。并返回`NO`来防止webView进行跳转，至此一个基本的从 js 到oc方法的调用的过程结束。

采用js对正文点击事件监测，然后返回


###  JavaScriptCore

这部分主要是看一下，JSPatch和React-Native源码


