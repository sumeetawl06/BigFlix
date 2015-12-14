//
//  ViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 25/11/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "ViewController.h"
#import <PureLayout/PureLayout.h>


#import <VKFoundation/VKFoundation.h>
#import <VKVideoPlayerViewController.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *playerView;
@property (nonatomic, strong) UIButton *simpleFirstButton;
@property (nonatomic, strong) AVPlayer *mainPlayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAVPlayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCustomView {
    
    self.playerView = [[UIView alloc]initForAutoLayout];
    self.playerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.playerView];
    
    [self.playerView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.playerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.playerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.playerView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
}

- (void)addSimpleFirstButton {
    
    self.simpleFirstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.simpleFirstButton setTitle:@"first" forState:UIControlStateNormal];
    [self.playerView addSubview:self.simpleFirstButton];
    
    [self.simpleFirstButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.0];
    [self.simpleFirstButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.simpleFirstButton autoSetDimensionsToSize:CGSizeMake(20, 20)];
    
}

- (void)addAVPlayer {
    
//    AVPlayerItem *playerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=kPBzTxZQG5Q"]];
//    
//    self.mainPlayer  = [[AVPlayer alloc]initWithPlayerItem:playerItem];
//    
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.mainPlayer ];
//    
//    AVPlayerViewController *avplayerViewController = [[AVPlayerViewController alloc]init];
//    
//    avplayerViewController.player = self.mainPlayer;
//    
//    [self presentViewController:avplayerViewController animated:YES completion:nil];
    
    VKVideoPlayerViewController *viewController = [[VKVideoPlayerViewController alloc] init];
    [self presentModalViewController:viewController animated:YES];
    [viewController playVideoWithStreamURL:[NSURL URLWithString:@"http://content.viki.com/test_ios/ios_240.m3u8"]];}

@end
