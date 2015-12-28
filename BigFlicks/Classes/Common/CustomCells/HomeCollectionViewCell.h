//
//  homeCollectionViewCell.h
//  BigFlicks
//
//  Created by Jumpgames on 07/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UtilityMethods.h"
#import <PureLayout/PureLayout.h>

@interface HomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *movieImage;
@property (nonatomic, strong) UILabel *movieTitle;

@end
