//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "Page.h"
#import "Card.h"


@implementation Page

@synthesize cards = _cards;

- (instancetype)initWithTitle:(NSString *)title rows:(NSArray *)rows {
    self = [super init];
    if (self) {
        self.title = title;
        _cards = [[NSMutableArray alloc] init];
        [rows enumerateObjectsUsingBlock:^(NSDictionary* row, NSUInteger idx, BOOL *stop) {
            Card *card = [[[Card alloc] initWithTitle:[row valueForKey:@"title"] decription:[row valueForKey:@"description"] imageUrl:[row valueForKey:@"imageHref"]] autorelease];
            [_cards addObject:card];
        }];
    }

    return self;
}

- (void)dealloc {
    [_cards release];
    [super dealloc];
}
@end