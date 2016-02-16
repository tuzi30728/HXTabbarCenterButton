//
//  HXTabBarController.m
//  HXTabbarCenterButton
//
//  Created by HongXiangWen on 16/2/16.
//  Copyright © 2016年 can. All rights reserved.
//

#import "HXTabBarController.h"
#import "ViewController.h"
#import "UITabBar+HXCenterButton.h"

@interface HXTabBarController ()

@end

@implementation HXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 首页
    [self setUpChildControllerWith:[[ViewController alloc]init] norImage:[UIImage imageNamed:@"tabBar_essence_icon"] selImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] title:@"首页"];
    
    // 新帖
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_new_icon"] selImage:[UIImage imageNamed:@"tabBar_new_click_icon"] title:@"新帖"];
    
    // 关注
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"关注"];
    
    // 我的
    [self setUpChildControllerWith:[[ViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_me_icon"] selImage:[UIImage imageNamed:@"tabBar_me_click_icon"] title:@"我的"];
    
    /* 在此设置中间按钮 */
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    [centerButton addTarget:self action:@selector(chickCenterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar setUpTabBarCenterButton:centerButton];
}

- (void)chickCenterButton
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了中间按钮" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:doneAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)setUpChildControllerWith:(UIViewController *)childVc norImage:(UIImage *)norImage selImage:(UIImage *)selImage title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    childVc.title = title;
    childVc.tabBarItem.image = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

@end
