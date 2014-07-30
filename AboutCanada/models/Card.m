//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "Card.h"


@implementation Card

@synthesize image = _image;
@synthesize imageUrl = _imageUrl;

- (id)initWithTitle:(NSString *)title decription:(NSString *)decription imageUrl:(NSString *)url {
    self = [super init];
    if (self) {
        self.title = title;
        self.decription = decription;
        self.imageUrl = url;
    }

    return self;
}
@end