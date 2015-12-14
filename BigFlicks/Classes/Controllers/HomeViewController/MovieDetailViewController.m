//
//  MovieDetailViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 09/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "MovieDetailViewController.h"


@interface MovieDetailViewController () {
    
    NSMutableData *receivedData;
    NSURLConnection *connection;
}

@end

@implementation MovieDetailViewController

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
    [self addNavBarTitleWithTitleText:@"Details"];
    [self addNavigationBarLeftButtonWithImageName:@""];
    [self downloadAndPlayCheck];
    
}

- (void)downloadAndPlayCheck {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com/embed/hLwaQDpouEk"]];
    
    
}


#pragma mark - Event Handling 

- (void)navigationBarLeftButtonTapped {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
