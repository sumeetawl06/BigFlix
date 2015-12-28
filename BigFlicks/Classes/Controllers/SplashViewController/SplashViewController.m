//
//  SplashViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 01/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1242*2208"]];
    [imageView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:imageView];
    
    [imageView autoCenterInSuperview];
    [imageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    
    // Do any additional setup after loading the view.
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

@end
