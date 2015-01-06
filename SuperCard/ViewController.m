//
//  ViewController.m
//  SuperCard
//
//  Created by deast on 1/5/15.
//  Copyright (c) 2015 Firebase. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.playingCardView.suit = @"♣︎";
  self.playingCardView.rank = 13;
  
  // set up the pinch gesture recognizer
  [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView
                                                                                       action:@selector(pinch:)]];
}

- (IBAction)swipeCard:(UISwipeGestureRecognizer *)sender
{
  self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

@end
