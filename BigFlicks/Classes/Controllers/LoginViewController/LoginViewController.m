//
//  LoginViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 08/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginViewController

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
    [self addNavBarTitleWithTitleText:@"Login"];
    
    [self.view addSubview:self.loginButton];
    [self setConstraintsForLoginButton];
}

#pragma mark - Getters

- (UIButton *)loginButton {
    
    if (!_loginButton) {
        
        _loginButton = [UtilityMethods createButtonWithBackgroundImageNormal:@""
                                                        andSelectedImageName:@""
                                                                       title:@"Login"
                                                                    FontName:@""
                                                                    fontSize:13.0
                                                                fontColorHex:@"000000"
                                                                 eventTarget:self
                                                                      action:@selector(loginButtonTapped)
                                                                         tag:10];
        
    }
    [_loginButton setBackgroundColor:[UIColor brownColor]];
    return _loginButton;
}

#pragma mark - Constraints

- (void)setConstraintsForLoginButton {
    
    [self.loginButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:150];
    [self.loginButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.view];
    
}

#pragma mark - Event Handling 

- (void)loginButtonTapped {
    
    [self loadHomeScreen];
    
}

@end
