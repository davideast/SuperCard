//
//  PlayingCardView.m
//  SuperCard
//
//  Created by deast on 1/5/15.
//  Copyright (c) 2015 Firebase. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void)setSuit:(NSString *)suit
{
  _suit = suit;
  [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
  _rank = rank;
  [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
  _faceUp = faceUp;
  [self setNeedsDisplay];
}

#define CORNER_FRONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FRONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
  
  [roundedRect addClip];
  
  [[UIColor whiteColor] setFill];
  UIRectFill(self.bounds);
  
  [[UIColor blackColor] setStroke];
  [roundedRect stroke];
  
  [self drawCorners];
}

- (NSString *)rankAsString
{
  return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",  @"7",  @"8", @"9", @"10", @"J", @"Q", @"K"][self.rank];
}

- (void)drawCorners
{
  NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];
  paragraphStyle.alignment = NSTextAlignmentCenter;
  
  UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
  
  NSAttributedString *cornerText = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit]
                                                                  attributes:@{NSFontAttributeName : cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];
  
  CGRect textBounds;
  textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
  textBounds.size = [cornerText size];
  [cornerText drawInRect:textBounds];
  
}

- (void)setup
{
  self.backgroundColor = nil;
  self.opaque = NO;
  self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
  [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    
  }
  return self;
}

@end
