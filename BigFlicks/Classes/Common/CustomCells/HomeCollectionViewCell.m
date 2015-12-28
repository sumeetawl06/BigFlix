//
//  homeCollectionViewCell.m
//  BigFlicks
//
//  Created by Jumpgames on 07/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "homeCollectionViewCell.h"

@implementation HomeCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configureU];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.layer.borderColor = [[UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0] CGColor];
    self.layer.borderWidth = 1.0;
}

- (void)configureU {
    
    [self addMovieTitle];
    [self addMovieImage];
    
}

- (void)addMovieTitle {
    
    self.movieTitle = [UtilityMethods createLabelWitText:@"Text"
                                                    font:@""
                                                fontSize:12.5
                                            fontColorHex:@"000000"
                                           textAlignment:NSTextAlignmentCenter];
    
    [self.contentView addSubview:self.movieTitle];
    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5.0];
    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.movieTitle autoSetDimensionsToSize:CGSizeMake(100, 200)];
    
}

- (void)addMovieImage {
    
    self.movieImage = [[UIImageView alloc]initForAutoLayout];
    self.movieImage.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:self.self.movieImage];
    self.movieImage.backgroundColor = [UIColor blueColor];
    [self.movieImage autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movieTitle withOffset:5.0];
    [self.movieImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.movieImage autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.movieImage autoSetDimensionsToSize:CGSizeMake(100, 200)];
    
}

@end
