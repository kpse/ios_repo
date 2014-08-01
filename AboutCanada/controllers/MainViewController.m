//
// Created by kpse on 7/30/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MainViewController.h"
#import "JsonLoader.h"
#import "Page.h"
#import "Card.h"
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

    self.refreshControl = [[UIRefreshControl new] autorelease];
    self.refreshControl.tintColor = [UIColor blackColor];
    self.refreshControl.attributedTitle = [[[NSAttributedString alloc]
            initWithString:@"Refresh"] autorelease];
    [self.refreshControl addTarget:self action:@selector(refreshData)
                  forControlEvents:UIControlEventValueChanged];
    self.view.bounds = [[UIScreen mainScreen] bounds];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _page.cards.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MainTableViewCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = cell ? cell : [self createCell];
    [cell loadContent:_page.cards[indexPath.row]];

    return cell;
}

- (MainTableViewCell *)createCell {
    return [[[MainTableViewCell alloc]
            initWithStyle:UITableViewCellStyleDefault
          reuseIdentifier:@"MainTableViewCell"] autorelease];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [MainTableViewCell contentHeight:_page.cards[indexPath.row]];

}

- (void)refreshData {
    if (_page) {
        [_page release];
    }
    _page = [[[[JsonLoader new] autorelease] loadContent] retain];

    self.navigationItem.title = _page.title;

    self.refreshControl.attributedTitle = [[[NSAttributedString alloc]
            initWithString:@"Refreshing..."] autorelease];
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

@end