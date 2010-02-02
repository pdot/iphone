//
//  SettingsViewController.m
//  oscars
//
//  Created by Jason Whyne on 30/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"


@implementation SettingsViewController

@synthesize navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.navBar = [[[PDNavBar alloc] initWithFrame:CGRectMake(0, 400, 320, 460)] autorelease];
		[self.view addSubview:navBar];
    }
    return self;
}

- (void)viewDidUnload
{
	self.navBar = nil;
	[super viewDidUnload];
}

@end
