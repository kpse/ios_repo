//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Card;
@interface MainTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel* titleField;
@property (nonatomic, retain) UITextView* descriptionField;
@property (nonatomic, retain) UIImageView *imageField;

@property(retain) Card *card;

- (UITableViewCell *)loadContent:(Card *)card;
+ (CGFloat)contentHeight:(Card *)card;
@end