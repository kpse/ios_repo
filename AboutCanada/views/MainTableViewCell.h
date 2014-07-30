//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Card;
@interface MainTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel* titleField;
@property (nonatomic, strong) UITextView* descriptionField;
@property (nonatomic, strong) UIImageView *imageField;

- (UITableViewCell *)loadContent:(Card *)card;
+ (CGFloat)contentHeight:(Card *)card;
@end