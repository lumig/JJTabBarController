//
//  UIApplication+Extra.m
//  KXTabBarTest
//
//  Created by mac on 2018/8/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIApplication+Extra.h"

@implementation UIApplication (Extra)

+ (UIApplication *)appDelegate {
    return (UIApplication *)[UIApplication sharedApplication].delegate;
}

/** 获取当前屏幕显示的UIViewcontroller */
+ (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[self windowRootViewController]];
}

/** 获取rootViewController 的 最上层 UIViewcontroller */
+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
        
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
        
    } else {
        
        return rootViewController;
    }
}

/** 获取当前屏幕的RootViewController */
+ (UIViewController *)windowRootViewController {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}


@end
