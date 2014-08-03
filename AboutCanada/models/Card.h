//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject
@property (retain, nonatomic) NSString *title, *decription, *imageUrl;
@property (retain) UIImage *image;

- (id)initWithTitle:(NSString *)title decription:(NSString *)decription imageUrl:(NSString *)imageUrl;
- (UIImage *)download;

@end