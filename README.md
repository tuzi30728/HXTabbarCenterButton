使用方法
    1、#import "UITabBar+HXCenterButton.h"
    2、设置中间按钮
UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
[centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
[centerButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
[centerButton addTarget:self action:@selector(chickCenterButton) forControlEvents:UIControlEventTouchUpInside];
[self.tabBar setUpTabBarCenterButton:centerButton];
