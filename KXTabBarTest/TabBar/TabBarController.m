//
//  TabBarController.m
//  KXTabBarTest
//
//  Created by mac on 2018/8/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TabBarController.h"
#import "TabBar.h"
#import "LiveViewController.h"
#import "FinderViewController.h"
#import "CreatViewController.h"
#import "MsgViewController.h"
#import "MineViewController.h"
#import "UIColor+Extra.h"
#import "UIApplication+Extra.h"

static NSInteger const kDefaultSelectedIndex = 0;

@interface TabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UIView *lineView;

@end

@implementation TabBarController

+ (instancetype)shareInstance
{
    static TabBarController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;

    // 添加所有的控制器
    [self initSubView];
    }

- (void)initSubView
{
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"666666"], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:10.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    //
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#FC4CFF"], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:10.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];

    TabBar *tabbar = [[TabBar alloc]init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar setShadowImage:[UIImage new]];
    //    [self.tabBar setBackgroundImage:[UIImage imageFromContextWithColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.78]]];
    self.tabBar.translucent = NO;
    
    
        LiveViewController *live = [[LiveViewController alloc] init];
    UINavigationController *liveNav = [self addChildVc:live title:@"直播" imageName:@"tabbar_zhibo_n" selectedImageName:@"tabbar_zhibo_s"];
    

    FinderViewController * competition = [[FinderViewController alloc] init];
    UINavigationController *competitionNav = [self addChildVc:competition title:@"发现" imageName:@"tabbar_find_n" selectedImageName:@"tabbar_find_s"];

    MsgViewController * message = [[MsgViewController alloc] init];
    UINavigationController *messageNav = [self addChildVc:message title:@"消息" imageName:@"tabbar_message_n" selectedImageName:@"tabbar_message_s"];
    
    MineViewController * mine = [[MineViewController alloc] init];
    UINavigationController *mineNav = [self addChildVc:mine title:@"我的" imageName:@"tabbar_my_n" selectedImageName:@"tabbar_my_s"];
    
    [self setViewControllers:@[liveNav, competitionNav, messageNav, mineNav]];
    
}

- (UINavigationController *)addChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    UIImage * normalImg = [UIImage imageNamed:imageName];
    UIImage * selectImg = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.image = [normalImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
   
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    return nav;
}


- (void)centerBtnDidClick:(UIButton *)btn {

}

#pragma mark - Publics
/**
 *  该方法将外层present的控制器dismiss，直到返回到当前的tabbarController控制器，
 *  并根据设置的selectedIndex返回到所设置的的索引tabbar模块
 */
- (void)resetEnvironmentCompletion:(void (^)(UIViewController *vc))completion {
    [self resetEnvironmentTabBarSelectedIndex:kDefaultSelectedIndex completion:completion];
}

- (void)resetEnvironmentTabBarSelectedIndex:(NSInteger)selectedIndex completion:(void (^)(UIViewController *vc))completion {
    UIViewController *controller = [UIApplication topViewController];
    
    UIViewController *presentedViewController = nil;
    if (controller.navigationController) {
        presentedViewController = controller.navigationController;
    }else {
        presentedViewController = controller;
    }
    
    UIViewController *presentingViewController = presentedViewController.presentingViewController;
    if (presentingViewController) {
        [presentedViewController dismissViewControllerAnimated:NO completion:^{
            [self resetEnvironmentTabBarSelectedIndex:selectedIndex completion:completion];
        }];
    }else{
        //重置
        [self initSubView];
        self.selectedIndex = selectedIndex;
        completion(controller);
    }
}



@end
