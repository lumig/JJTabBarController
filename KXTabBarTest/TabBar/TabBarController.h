//
//  TabBarController.h
//  KXTabBarTest
//
//  Created by mac on 2018/8/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController

+ (instancetype)shareInstance;
- (void)resetEnvironmentCompletion:(void (^)(UIViewController *vc))completion;
- (void)resetEnvironmentTabBarSelectedIndex:(NSInteger)selectedIndex completion:(void (^)(UIViewController *vc))completion;

@end
