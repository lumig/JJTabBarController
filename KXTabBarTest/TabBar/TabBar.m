//
//  TabBar.m
//  KXTabBarTest
//
//  Created by mac on 2018/8/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar
- (instancetype)init {
    self = [super init];
    if (self) {
        self.centerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.centerBtn setImage:[[UIImage imageNamed:@"tabbar_kaibo"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateNormal ];
        self.centerBtn.bounds = CGRectMake(0, 0, 64, 64);
        [self addSubview:self.centerBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"---%@",NSStringFromCGRect(self.frame));
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, 49 * 0.4);
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 5;
    
    NSMutableArray *sorts = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", nil];

    for (UIView* sub in self.subviews) {
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            for (UIView *v in sub.subviews) {
                if ([v isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")] ) {
                    if ([[v valueForKey:@"text"] isEqualToString:@"我的"]) {
                        [sorts replaceObjectAtIndex:3 withObject:sub];
                    }
                    
                    else if ([[v valueForKey:@"text"] isEqualToString:@"直播"]) {
                        [sorts replaceObjectAtIndex:0 withObject:sub];
                    }
                    
                    else if ([[v valueForKey:@"text"] isEqualToString:@"发现"]) {
                        [sorts replaceObjectAtIndex:1 withObject:sub];
                    }
                    
                    else if ([[v valueForKey:@"text"] isEqualToString:@"消息"]) {
                        [sorts replaceObjectAtIndex:2 withObject:sub];
                    }
                    break;
                }
            }
            
        }
    }
    
    
    
    for (UIView *sub in sorts) {
        CGRect frame = sub.frame;
        frame.origin.x = index * wigth;
        frame.size.width= wigth;
        
        sub.frame = frame;
        index++;
        if (index == 2) {
            index++;
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) {
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}
@end
