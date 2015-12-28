//
//  CommonViewController.h
//  BigFlicks
//
//  Created by Jumpgames on 01/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "UtilityMethods.h"
#import "Constant.h"
#import "RESideMenu.h"


@interface CommonViewController : UIViewController <RESideMenuDelegate>

@property (strong, nonatomic) UIView *navigationBar;
@property (strong, nonatomic) UIButton *navigationBarLeftButton;
@property (strong, nonatomic) UIButton *navigationBarRightButton;

- (void)addNavigationBar;
- (void)addNavBarTitleWithTitleText:(NSString *)title;
- (void)addNavigationBarLeftButtonWithImageName:(NSString *)imageName;
- (void)addNavigationBarRightButtonWithImageName:(NSString *)imageName;

- (void)loadHomeScreen;

@end
