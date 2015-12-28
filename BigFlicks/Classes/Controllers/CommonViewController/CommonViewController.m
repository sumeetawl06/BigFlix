//
//  CommonViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 01/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "CommonViewController.h"
#import "HomeViewController.h"
#import "MenuDrawerViewController.h"
#import "AppDelegate.h"

@interface CommonViewController ()

@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) MenuDrawerViewController *menuDrawerViewController;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNavigationBar {
    
    self.navigationBar = [[UIView alloc]initForAutoLayout];
    [self.view addSubview:self.navigationBar];
    [self.navigationBar autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.navigationBar autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.navigationBar autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.navigationBar autoSetDimension:ALDimensionHeight toSize:NAV_BAR_HEIGHT];
    
    [self.navigationBar setBackgroundColor:[UIColor brownColor]];
    
}

- (void)addNavBarTitleWithTitleText:(NSString *)title {
    
    UILabel *label = [[UILabel alloc]initForAutoLayout];
    
    label.text = title;
    
    [self.navigationBar addSubview:label];
    
    [label autoAlignAxis:ALAxisVertical toSameAxisOfView:self.navigationBar];
    [label autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10.0];
    
}

- (void)addNavigationBarLeftButtonWithImageName:(NSString *)imageName {
    
    self.navigationBarLeftButton = [UtilityMethods createButtonWithBackgroundImageNormal:@""
                                                                    andSelectedImageName:@""
                                                                                   title:@""
                                                                                FontName:@""
                                                                                fontSize:12.0
                                                                            fontColorHex:@"000000"
                                                                             eventTarget:self
                                                                                  action:@selector(navigationBarLeftButtonTapped)
                                                                                     tag:10];
    
    [self.navigationBar addSubview:self.navigationBarLeftButton];
    [self.navigationBarLeftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.navigationBarLeftButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5.0];
    [self.navigationBarLeftButton autoSetDimensionsToSize:CGSizeMake(30, 30)];

}

- (void)addNavigationBarRightButtonWithImageName:(NSString *)imageName {
    
}

#pragma mark - Event Handling

- (void)navigationBarLeftButtonTapped {
    
    
}

#pragma mark - LoadHomeScreen 

- (void)loadHomeScreen {
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    [navigationController setNavigationBarHidden:YES];
    self.homeViewController = [[HomeViewController alloc]init];
    self.menuDrawerViewController = [[MenuDrawerViewController alloc]init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc]initWithContentViewController:navigationController
                                                                   leftMenuViewController:self.menuDrawerViewController
                                                                  rightMenuViewController:nil];
    
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    APP_DELEGATE.window.rootViewController = sideMenuViewController;
    
    APP_DELEGATE.window.backgroundColor = [UIColor whiteColor];
    [APP_DELEGATE.window makeKeyAndVisible];
      
}

@end
