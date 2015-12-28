//
//  UtilityMethods.m
//  BigFlicks
//
//  Created by Jumpgames on 04/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "UtilityMethods.h"

@implementation UtilityMethods

#pragma mark - Button

+ (UIButton *)createButtonWithBackgroundImageNormal:(NSString*)imageName andSelectedImageName:(NSString *)selectedImage title:(NSString *)title FontName:(NSString *)fontName fontSize:(CGFloat)fontSize fontColorHex:(NSString *)fontColor eventTarget:(id)targetObject action:(SEL)action tag:(NSInteger)tag {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [button.titleLabel setFont:[UIFont fontWithName:fontName size:fontSize]];
    [button.titleLabel setTextColor:[self colorFromHexString:fontColor]];
    [button addTarget:targetObject action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark - Color

+ (UIColor *)colorFromHexString:(NSString *)hexString {

    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

#pragma mark - Label

+ (UILabel *)createLabelWitText:(NSString *)titleText font:(NSString *)fontName fontSize:(CGFloat)fontSize fontColorHex:(NSString *)fontColor textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc]init];
    
    [label setFont:[UIFont fontWithName:fontName size:fontSize]];
    
    [label setTextAlignment:textAlignment];
    
    [label setTextColor:[self colorFromHexString:fontColor]];
    
    return label;
    
}

#pragma mark - ImageView

+ (UIImageView *)createImageViewWithImageName:(NSString *)imagename {

    if (imagename) {
        
    }
    
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imagename]];
    
    return imageview;
    
}

#pragma mark - String Utils 

- (BOOL)isStringPresent:(NSString *)string {
    
    if (string == (id)[NSNull null] || string.length == 0 ) {
        
        return NO;
    }else {
        
        return YES;
    }
        
    return YES;
}
@end
