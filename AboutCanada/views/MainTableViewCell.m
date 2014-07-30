//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MainTableViewCell.h"
#import "Card.h"


@implementation MainTableViewCell

@synthesize titleField = _titleField;
@synthesize descriptionField = _descriptionField;
@synthesize imageField = _imageField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        UIColor *bgColor = [UIColor whiteColor];
        self.contentView.backgroundColor = bgColor;

        [self setUpTitleField];

        [self setUpImageField];

        [self setUpDescriptionField];


    }
    return self;
}

- (UITableViewCell *)loadContent:(Card *)card {
    _titleField.text = [card.title isKindOfClass:[NSNull class]] ? @"" : card.title;
    _descriptionField.text = [card.decription isKindOfClass:[NSNull class]] ? @"" : card.decription;
    [self loadImage:card];
    self.layer.masksToBounds = YES;
    return self;
}

- (void)setUpDescriptionField {
    _descriptionField = [[[UITextView alloc] initWithFrame:CGRectMake(10, 90, 300, 20)] autorelease];
    _descriptionField.textAlignment = NSTextAlignmentLeft;
    _descriptionField.font = [UIFont systemFontOfSize:14];
    _descriptionField.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _descriptionField.userInteractionEnabled = NO;
    _descriptionField.textColor = [UIColor blackColor];
    _descriptionField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_descriptionField];
}

- (void)setUpImageField {
    _imageField = [[[UIImageView alloc] initWithFrame:CGRectMake(110, 40, 100, 50)] autorelease];
    _imageField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imageField];
}

- (void)setUpTitleField {
    _titleField = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)] autorelease];
    _titleField.textAlignment = NSTextAlignmentCenter;
    _titleField.font = [UIFont boldSystemFontOfSize:16];
    _titleField.textColor = [UIColor blueColor];
    _titleField.translatesAutoresizingMaskIntoConstraints = NO;
    _titleField.numberOfLines = 0;
    _titleField.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_titleField];
}

+ (CGFloat)contentHeight:(Card *)card {
    NSString *desc = [card.decription isKindOfClass:[NSNull class]] ? @"" : card.decription;
    NSString *title = [card.title isKindOfClass:[NSNull class]] ? @"" : card.title;
    CGSize constraint = CGSizeMake([self adjustmentSpace], 20000.0f);
    CGSize descriptionSize = [desc sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGSize labelSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:16] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = descriptionSize.height + labelSize.height + [self adjustment];
    return height > 50 ? height : 50;


}

+ (CGFloat)adjustmentSpace {
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    return orientation == UIInterfaceOrientationPortrait ? 240 : 600;
}

+ (CGFloat)adjustment {
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    return orientation == UIInterfaceOrientationPortrait ? 80 : 60;
}

- (void)loadImage:(Card *)card {
    dispatch_queue_t myQueue = dispatch_queue_create("Download queue", NULL);
    dispatch_async(myQueue, ^{
        // Perform long running process
        UIImage *image = [card download];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            _imageField.image = image;
        });
    });
}
@end