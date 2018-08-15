//
//  UIApplication+Extra.h
//  KXTabBarTest
//
//  Created by mac on 2018/8/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extra)
+ (UIApplication *)appDelegate;

/** 获取当前屏幕正在显示的UIViewcontroller */
+ (UIViewController*)topViewController;

/** 获取rootViewController 的 最上层 UIViewcontroller */
+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController;

/** 获取当前屏幕的RootViewController */
+ (UIViewController *)windowRootViewController;
@end
