//
//  IntroductionViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 08/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "IntroductionViewController.h"
#import "LoginViewController.h"

@interface IntroductionViewController ()

@property (nonatomic, strong) UIButton *signInButton;

@end

@implementation IntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    
    [super loadView];
    
    [self addNavigationBar];
    [self addNavBarTitleWithTitleText:@"BIGFLIX"];
    
    [self.view addSubview:self.signInButton];
    
    [self setConstraintsForSignInButton];
    
}

#pragma mark - Getters

- (UIButton *)signInButton {
    
    if (!_signInButton) {
        
        _signInButton = [UtilityMethods createButtonWithBackgroundImageNormal:@""
                                                         andSelectedImageName:@""
                                                                        title:@"Sign In"
                                                                     FontName:@""
                                                                     fontSize:12.0
                                                                 fontColorHex:@"000000"
                                                                  eventTarget:self
                                                                       action:@selector(signInButtonTapped)
                                                                          tag:10];
        
    }
    [_signInButton setBackgroundColor:[UIColor grayColor]];
    return _signInButton;
}

#pragma mark - Constraints

- (void)setConstraintsForSignInButton {
    
    [_signInButton autoSetDimensionsToSize:CGSizeMake(150, 50)];
    [_signInButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_signInButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:100];
    
}

#pragma mark - Event Handling

- (void)signInButtonTapped {
    
    [APP_DELEGATE.masterViewController.loginNavigationController pushViewController:[[LoginViewController alloc]init] animated:YES];
    
}

@end
