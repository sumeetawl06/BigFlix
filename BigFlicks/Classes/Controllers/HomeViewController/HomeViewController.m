//
//  HomeViewController.m
//  BigFlicks
//
//  Created by Jumpgames on 04/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "MovieDetailViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, HomeTableViewCellDelegate>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSArray *sampleData;
@property (nonatomic, strong) UIScrollView *pageControllerScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)loadView {

    [super loadView];
    
    self.sampleData = @[ @{ @"description": @"Section A",
                            @"articles": @[ @{ @"title": @"Article A1" },
                                            @{ @"title": @"Article A2" },
                                            @{ @"title": @"Article A3" },
                                            @{ @"title": @"Article A4" },
                                            @{ @"title": @"Article A5" }
                                            ]
                            },
                         @{ @"description": @"Section B",
                            @"articles": @[ @{ @"title": @"Article B1" },
                                            @{ @"title": @"Article B2" },
                                            @{ @"title": @"Article B3" },
                                            @{ @"title": @"Article B4" },
                                            @{ @"title": @"Article B5" }
                                            ]
                            },
                         @{ @"description": @"Section C",
                            @"articles": @[ @{ @"title": @"Article C1" },
                                            @{ @"title": @"Article C2" },
                                            @{ @"title": @"Article C3" },
                                            @{ @"title": @"Article C4" },
                                            @{ @"title": @"Article C5" }
                                            ]
                            },
                         @{ @"description": @"Section D",
                            @"articles": @[ @{ @"title": @"Article D1" },
                                            @{ @"title": @"Article D2" },
                                            @{ @"title": @"Article D3" },
                                            @{ @"title": @"Article D4" },
                                            @{ @"title": @"Article D5" }
                                            ]
                            },
                         @{ @"description": @"Section E",
                            @"articles": @[ @{ @"title": @"Article E1" },
                                            @{ @"title": @"Article E2" },
                                            @{ @"title": @"Article E3" },
                                            @{ @"title": @"Article E4" },
                                            @{ @"title": @"Article E5" }
                                            ]
                            },
                         @{ @"description": @"Section F",
                            @"articles": @[ @{ @"title": @"Article F1" },
                                            @{ @"title": @"Article F2" },
                                            @{ @"title": @"Article F3" },
                                            @{ @"title": @"Article F4" },
                                            @{ @"title": @"Article F5" }
                                            ]
                            },
                         ];

    
    [self addNavigationBar];
    [self addNavBarTitleWithTitleText:@"NetFlix"];
    [self addNavigationBarLeftButtonWithImageName:@""];
    
    [self createPaegController];
    
    [self.view addSubview:self.homeTableView];
    [self setConstraintsForHomeTableView];
    
}

- (void)createPaegController {
    
    [self.view addSubview:self.pageControllerScrollView];
    
    [self setConstraintsForPageControlScrollView];
    
}

#pragma mark - Getters 

- (UITableView *)homeTableView {
    
    if (!_homeTableView) {
        
        _homeTableView = [[UITableView alloc]initForAutoLayout];
        [_homeTableView setDelegate:self];
        [_homeTableView setDataSource:self];
    }
    return _homeTableView;
}

- (UIScrollView *)pageControllerScrollView {
    
    if (!_pageControllerScrollView) {
        
        _pageControllerScrollView = [[UIScrollView alloc]initForAutoLayout];
        [_pageControllerScrollView setContentSize:CGSizeMake(750, 140)];
        [_pageControllerScrollView setDelegate:self];
        
    }
    
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 50, 21)];
    [label setText:@"Hello"];
    [_pageControllerScrollView addSubview:label];
    [_pageControllerScrollView setPagingEnabled:YES];
    _pageControllerScrollView.showsHorizontalScrollIndicator = NO;
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(110,5,100,100);
    pageControl.numberOfPages = 2;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor redColor];
    return _pageControllerScrollView;
}

#pragma mark 

- (void)setConstraintsForHomeTableView {
    
    [self.homeTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
    [self.homeTableView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
    [self.homeTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
    [self.homeTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.pageControllerScrollView withOffset:10];

}

- (void)setConstraintsForPageControlScrollView {
    
    [self.pageControllerScrollView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:NAV_BAR_HEIGHT + 10];
    [self.pageControllerScrollView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.pageControllerScrollView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.pageControllerScrollView autoSetDimension:ALDimensionHeight toSize:150];
    
}

#pragma mark - UITable View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 180.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell;
    NSString *cellIdentifier = @"cell Identifier";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.homeTableViewCellDelegate = self;
    }
    
    NSLog(@"Indexpath.row %ld", (long)indexPath.section);
    
    [cell setCollectionData:[self.sampleData objectAtIndex:indexPath.section]];
//    cell.textLabel.text = @"text";
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSDictionary *sectionData = [self.sampleData objectAtIndex:section];
    NSString *header = [sectionData objectForKey:@"description"];
    return header;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sampleData.count;
    
}

#pragma mark - Cell Delegate Method

- (void)cellSelectedWithData:(NSDictionary *)dataDictionary {
    
    MovieDetailViewController *movieDetailViewController = [[MovieDetailViewController alloc]init];
    
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
    
}

@end
