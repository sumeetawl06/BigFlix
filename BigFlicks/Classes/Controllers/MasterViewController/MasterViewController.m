//
//  MasterViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 01/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//
#import "MasterViewController.h"
#import "SplashViewController.h"
#import <PureLayout/PureLayout.h>
#import <AFNetworking/AFNetworking.h>
#import "IntroductionViewController.h"
#import "MasterViewController.h"

@interface MasterViewController ()

@property (nonatomic, strong) SplashViewController *splashViewController;
@property (nonatomic, strong) IntroductionViewController *introductionViewController;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    
    [self showSplashScreen];
    
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)showSplashScreen {
    
    self.splashViewController = [[SplashViewController alloc]init];
    
    [self.view addSubview:self.splashViewController.view ];
    
    [self.splashViewController.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self performSelector:@selector(removeSplashScreen) withObject:self afterDelay:3];
    
}

- (void)removeSplashScreen {
    
    [self.splashViewController.view removeFromSuperview];
    self.splashViewController = nil;
    
    [self loadLoginNavigationController];
    
}

- (void)loadLoginNavigationController {
    
    _introductionViewController = [[IntroductionViewController alloc]init];
    
    self.loginNavigationController = [[UINavigationController alloc]initWithRootViewController:self.introductionViewController];
    [self.loginNavigationController setNavigationBarHidden:YES];
    
    [self.view addSubview:self.loginNavigationController.view];
    
}

- (void)apiCall {
    
    
    
}

@end

