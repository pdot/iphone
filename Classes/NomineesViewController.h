//
//  NomineeViewController.h
//  active_resource
//
//  Created by vickeryj on 8/21/08.
//  Copyright 2008 Joshua Vickery. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Award;


@interface NomineesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	Award *category;
	NSMutableArray *nominees;
	IBOutlet UITableView *tableView;
}

@property(nonatomic , retain) Award *category;
@property(nonatomic , retain) NSArray *nominees;
@property(nonatomic , retain) UITableView *tableView;

@end
