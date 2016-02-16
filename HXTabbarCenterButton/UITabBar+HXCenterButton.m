//
//  UITabBar+HXCenterButton.m
//  HXCenterButtonTabbar
//
//  Created by HongXiangWen on 16/2/16.
//  Copyright © 2016年 HongXiangWen. All rights reserved.
//

#import "UITabBar+HXCenterButton.h"
#import <objc/runtime.h>

@implementation UITabBar (HXCenterButton)

static NSString *CenterButtonKey;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)swizzled_layoutSubviews
{
    [self swizzled_layoutSubviews];
    
    [self setValue:[NSValue valueWithCGRect:self.bounds] forKeyPath:@"_backgroundView.frame"];
    
    UIButton *centerButton = objc_getAssociatedObject(self, &CenterButtonKey);
    centerButton.bounds = CGRectMake(0, 0, centerButton.currentBackgroundImage.size.width, centerButton.currentBackgroundImage.size.height);
    CGFloat buttonW = self.frame.size.width / (centerButton ? self.items.count + 1 : self.items.count);
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    int index = 0;
    centerButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    for (UIView *chidView in self.subviews) {
        if ([chidView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            buttonX = index * buttonW;
            index++;
            if (index == self.items.count / 2 && centerButton) {
                index++;
            }
            chidView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }
    }
}

- (void)setUpTabBarCenterButton:(UIButton *)centerButton
{
    objc_setAssociatedObject(self, &CenterButtonKey, centerButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addSubview:centerButton];
}
@end
