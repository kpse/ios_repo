//
// Created by kpse on 7/29/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "JsonLoader.h"
#import "CJSONDeserializer.h"
#import "Page.h"


@implementation JsonLoader {

}
- (Page *)loadContent {
    NSDictionary *dictionary = [self load];
    return [[[Page alloc] initWithTitle:[dictionary valueForKey:@"title"] rows:[dictionary valueForKey:@"rows"]] autorelease];
}

- (NSDictionary *)load {
    NSString *jsonString = [self jsonFromFile];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    return [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
}

- (NSString *)jsonFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"facts" ofType:@"json"];
    NSError *err = nil;
    return [NSString stringWithContentsOfFile:path encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingWindowsHebrew) error:&err];
}

@end