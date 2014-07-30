//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "JsonLoader.h"
#import "Page.h"
#import "Card.h"
#import "MainViewController.h"
#import "MainTableViewCell.h"


@interface MainViewController () {
    Page *_page;
}
@end

@implementation MainViewController

- (void)dealloc {
    [_page release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _page = [[[[JsonLoader new] autorelease] loadContent] retain];

    self.navigationItem.title = _page.title;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _page.cards.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [[[MainTableViewCell alloc]
            initWithStyle:UITableViewCellStyleDefault
          reuseIdentifier:@"Cell"] autorelease];

    [cell loadContent:_page.cards[indexPath.row]];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [MainTableViewCell contentHeight:_page.cards[indexPath.row]];

}

@end