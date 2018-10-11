//
//  ViewController.m
//  weex
//
//  Created by nenhall_work on 2018/10/11.
//  Copyright © 2018 nenhall_studio. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface ViewController ()
//WXSDKInstance属性
@property (nonatomic, strong) WXSDKInstance *instance;
//URL属性(用于指定加载js的URL,一般声明在接口中,我们为了测试方法写在了类扩展中.)
@property (nonatomic, strong) NSURL *url;
//Weex视图
@property (weak, nonatomic) UIView *weexView;
@end

@implementation ViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 创建WXSDKInstance对象
    _instance = [[WXSDKInstance alloc] init];
    
    // 设置weexInstance所在的控制器
    _instance.viewController = self;
    
    //设置weexInstance的frame
    _instance.frame = self.view.frame;
    
    //设置weexInstance用于渲染的`js`的URL路径(后面说明)
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
    
    //为了避免循环引用声明一个弱指针的`self`
    __weak typeof(self) weakSelf = self;
    
    //设置weexInstance创建完毕回调
    _instance.onCreate = ^(UIView *view) {
        weakSelf.weexView = view;
        [weakSelf.weexView removeFromSuperview];
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    // 设置`weexInstance`出错的回调
    _instance.onFailed = ^(NSError *error) {
        //process failure
        NSLog(@"处理失败:%@",error);
    };
    
    //设置渲染完成的回调
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
        NSLog(@"渲染完成");
    };
}

- (NSURL *)url {
    if (!_url) {
        //examples.weex about.weex landing.weex guide.weex news.weex
        NSString *jsUrl = @"about.weex";
        _url =  [[NSBundle mainBundle] URLForResource:jsUrl withExtension:@"js"];
    }
    return _url;
}

@end
