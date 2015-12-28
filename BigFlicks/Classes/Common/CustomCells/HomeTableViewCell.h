//
//  HomeTableViewCell.h
//  BigFlicks
//
//  Created by Jumpgames on 04/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>

@protocol  HomeTableViewCellDelegate <NSObject>

- (void)cellSelectedWithData:(NSMutableDictionary *)dataDictionary;

@end

@interface HomeTableViewCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

- (void)setCollectionData:(NSMutableDictionary *)collectionData;

@property (nonatomic, assign) id<HomeTableViewCellDelegate> homeTableViewCellDelegate;

@property (nonatomic, strong) UICollectionView *homeCellCollectionView;
@property (strong, nonatomic) NSMutableDictionary *collectionData;


@end
