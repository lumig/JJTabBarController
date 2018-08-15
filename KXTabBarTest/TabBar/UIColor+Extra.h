//
//  UIColor+Extra.h
//  KXLive
//
//  Created by luming on 2018/7/29.
//  Copyright © 2018年 ibobei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extra)

//0xfec82e
+ (UIColor *)defaultMainColor;

//763f01
+ (UIColor *)defaultTitleColor;

// 181818
+ (UIColor *)defaultTextColor;

//666666
+ (UIColor *)defaultSubTextColor;


+ (UIColor *)defaultAssistTextColor;


+ (UIColor *)defaultDescriptionColor;


+ (UIColor *)defaultBackgroundColor;


/**
 红色按钮不可选择时的颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultButtonEnableColor;
+ (UIColor *)defaultButtonColor;


+ (UIColor *)defaultLineColor;

+ (UIColor *)colorWithHexString:(NSString *)hexString;


/**
 红色按钮高亮

 @return <#return value description#>
 */
+ (UIColor *)defaultRedColor;


/**
 红色按钮被选中的颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultSelectedColor;


/**
 白色按钮正常时和禁用时的颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultWhiteButtonNormalClolor;


/**
 白色按钮高亮时颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultWhiteButtonHighlightColor;


/**
 白色按钮禁用时字体颜色

 @return <#return value description#>
 */
+ (UIColor *)defaultWhiteButtonEnableTitleColor;

#pragma mark - 本项目
/**
 34B2D1
 */
+ (UIColor *)defaultBtnColor;
@end
