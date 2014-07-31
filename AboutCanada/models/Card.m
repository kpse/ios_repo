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

- (UIImage *)download {

    if (![_imageUrl isKindOfClass:[NSNull class]] && !_image) {
        NSLog(@"%@ load image %@", _title, _imageUrl);
        return _image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_imageUrl]]];
    }
    return _image;

}

- (UIImage *)defaultImage {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"no_image" ofType:@"jpg"];
    return [UIImage imageWithContentsOfFile:filePath];
}

- (void)dealloc {
    [_title release];
    [_decription release];
    [_imageUrl release];
    if (_image != nil){
        [_image release];
        _image = nil;
    }
    [super dealloc];
}
@end