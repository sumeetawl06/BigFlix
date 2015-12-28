//
//  HomeTableViewCell.m
//  BigFlicks
//
//  Created by Jumpgames on 04/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeCollectionViewCell.h"


@implementation HomeTableViewCell 

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
    }
    return self;
}

- (void)configureUI {
    
    [self addCollectionView];
    
}

- (void)addCollectionView {
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(130.0, 170.0);
    self.homeCellCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    [self.homeCellCollectionView setDataSource:self];
    [self.homeCellCollectionView setDelegate:self];
    
    [self.homeCellCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.homeCellCollectionView setBackgroundColor:[UIColor redColor]];
    
    [self.contentView addSubview:self.homeCellCollectionView];
    
    [self.homeCellCollectionView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
    [self.homeCellCollectionView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
    [self.homeCellCollectionView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0];
    [self.homeCellCollectionView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.0];
    
}

- (void)setCollectionData:(NSMutableDictionary *)collectionData forSectionNumber:(NSUInteger)sectionNumber {
    
    [self configureUI];
    
    self.cellNumber = sectionNumber;
    _collectionData = collectionData;
    [_homeCellCollectionView setContentOffset:CGPointZero animated:NO];
    [_homeCellCollectionView reloadData];
    
}

#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [self.collectionData count];
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    NSArray *cellData = [_collectionData valueForKey:@"articles"];
    NSMutableDictionary *dict = [cellData objectAtIndex:indexPath.item];
    cell.movieTitle.text = [dict objectForKey:@"title"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
    [self.homeTableViewCellDelegate cellSelectedWithData:nil];
    
}

@end
