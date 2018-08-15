//
//  UIColor+Extra.m
//  KXLive
//
//  Created by luming on 2018/7/29.
//  Copyright © 2018年 ibobei. All rights reserved.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)

//0xfec82e
+ (UIColor *)defaultMainColor
{
    return [UIColor whiteColor];
}

//763f01
+ (UIColor *)defaultTitleColor
{
    return [UIColor colorWithHexString:@"0x4F4E58"];

}

// 181818
+ (UIColor *)defaultTextColor;
{
    return [UIColor colorWithHexString:@"181818"];

}

//666666
+ (UIColor *)defaultSubTextColor
{
    return [UIColor colorWithHexString:@"666666"];

}

+ (UIColor *)defaultAssistTextColor
{
    return [UIColor colorWithHexString:@"666666"];
}

+ (UIColor *)defaultDescriptionColor
{
    return [UIColor colorWithHexString:@"4F4E58"];
}


+ (UIColor *)defaultBackgroundColor
{
    return [UIColor colorWithHexString:@"f2f2f2"];
}


+ (UIColor *)defaultLineColor
{
    return [UIColor colorWithHexString:@"#979797"];
}

+ (UIColor *)defaultButtonEnableColor
{
    return [UIColor colorWithHexString:@"#e1e1e1"];

}
+ (UIColor *)defaultButtonColor
{
    return [UIColor colorWithHexString:@"#F16657"];

}

+ (UIColor *)defaultRedColor
{
    return [UIColor colorWithHexString:@"#F15657"];

}

+ (UIColor *)defaultSelectedColor{
    
    return [UIColor colorWithHexString:@"#CC4E4F"];
}

+ (UIColor *)defaultWhiteButtonNormalClolor{
    
    return [UIColor colorWithHexString:@"#FFFFFF"];
}

+ (UIColor *)defaultWhiteButtonHighlightColor{
    
    return [UIColor colorWithHexString:@"#F3F3F3"];
}

+ (UIColor *)defaultWhiteButtonEnableTitleColor{
    
    return [UIColor colorWithHexString:@"#CCCCCC"];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark - 范杨
+ (UIColor *)defaultBtnColor
{
    return [UIColor colorWithHexString:@"34B2D1"];
}
@end
