//
//  UtilityMethods.h
//  BigFlicks
//
//  Created by Jumpgames on 04/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UtilityMethods : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString;
    
+ (UIButton *)createButtonWithBackgroundImageNormal:(NSString*)imageName andSelectedImageName:(NSString *)selectedImage title:(NSString *)title FontName:(NSString *)fontName fontSize:(CGFloat)fontSize fontColorHex:(NSString *)fontColor eventTarget:(id)targetObject action:(SEL)action tag:(NSInteger)tag ;

+ (UILabel *)createLabelWitText:(NSString *)titleText font:(NSString *)fontName fontSize:(CGFloat)fontSize fontColorHex:(NSString *)fontColor textAlignment:(NSTextAlignment)textAlignment;

+ (UIImageView *)createImageViewWithImageName:(NSString *)imagename;

@end
