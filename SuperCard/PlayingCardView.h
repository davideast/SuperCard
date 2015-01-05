//
//  PlayingCardView.h
//  SuperCard
//
//  Created by deast on 1/5/15.
//  Copyright (c) 2015 Firebase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

@end
