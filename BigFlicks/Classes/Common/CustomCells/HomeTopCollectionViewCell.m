//
//  HomeTopCollectionViewCell.m
//  BigFlicks
//
//  Created by Jumpgames on 28/12/15.
//  Copyright © 2015 BigFlix. All rights reserved.
//

#import "HomeTopCollectionViewCell.h"

@implementation HomeTopCollectionViewCell

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
    
    [self addMovieImage];
    
}

//- (void)addMovieTitle {
//    
//    self.movieTitle = [UtilityMethods createLabelWitText:@"Text"
//                                                    font:@""
//                                                fontSize:12.5
//                                            fontColorHex:@"000000"
//                                           textAlignment:NSTextAlignmentCenter];
//    
//    [self.contentView addSubview:self.movieTitle];
//    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5.0];
//    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
//    [self.movieTitle autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
//    [self.movieTitle autoSetDimensionsToSize:CGSizeMake(100, 200)];
//    
//}

- (void)addMovieImage {
    
    self.movieImageView = [[UIImageView alloc]initForAutoLayout];
    self.movieImageView.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:self.self.movieImageView];
    self.movieImageView.backgroundColor = [UIColor blueColor];
    [self.movieImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.0];
    [self.movieImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.0];
    [self.movieImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.0];
    
}

@end
