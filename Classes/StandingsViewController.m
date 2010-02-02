//
//  StandingsViewController.m
//  oscars
//
//  Created by Jason Whyne on 31/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StandingsViewController.h"


@implementation StandingsViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
	self.tableView = nil;
	[super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
