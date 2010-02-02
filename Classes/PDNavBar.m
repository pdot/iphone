//
//  PDNavBar.m
//  oscars
//
//  Created by Jason Whyne on 30/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PDNavBar.h"
#import	"NavigationViewController.h"
#import	"oscarsAppDelegate.h"

@implementation PDNavBar

@synthesize btnGroups, btnPicks, btnSettings;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
		
		btnGroups = [UIButton buttonWithType:UIButtonTypeCustom];
		btnGroups.frame = CGRectMake(70.0, 0.0, 40.0, 40.0);
		[btnGroups setImage:[UIImage imageNamed:@"icon_groups.png"] forState:UIControlStateNormal];
		[btnGroups addTarget:self action:@selector(groupsButtonWasPressed:) forControlEvents:UIControlEventTouchDown];
		[self addSubview:btnGroups];
		
		btnPicks = [UIButton buttonWithType:UIButtonTypeCustom];
		btnPicks.frame = CGRectMake(140.0, 0.0, 40.0, 40.0);
		[btnPicks setImage:[UIImage imageNamed:@"icon_picks.png"] forState:UIControlStateNormal];
		[btnPicks addTarget:self action:@selector(picksButtonWasPressed:) forControlEvents:UIControlEventTouchDown];
		[self addSubview:btnPicks];
		 
		btnSettings = [UIButton buttonWithType:UIButtonTypeCustom];
		btnSettings.frame = CGRectMake(210.0, 0.0, 40.0, 40.0);
		[btnSettings setImage:[UIImage imageNamed:@"icon_settings.png"] forState:UIControlStateNormal];
		[btnSettings addTarget:self action:@selector(settingsButtonWasPressed:) forControlEvents:UIControlEventTouchDown];
		[self addSubview:btnSettings];
    }
	
    return self;
}

- (void) groupsButtonWasPressed:(id) button
{
	oscarsAppDelegate *appDelegate = (oscarsAppDelegate*)[[UIApplication sharedApplication] delegate];
	NavigationViewController *navVC = (NavigationViewController*)[[[appDelegate navigationController] viewControllers] objectAtIndex:1];
	[navVC setSelectedView:groups];
	[[appDelegate navigationController] popToViewController:navVC animated:YES];
}

- (void) picksButtonWasPressed:(id) button
{
	oscarsAppDelegate *appDelegate = (oscarsAppDelegate*)[[UIApplication sharedApplication] delegate];
	NavigationViewController *navVC = (NavigationViewController*)[[[appDelegate navigationController] viewControllers] objectAtIndex:1];
	[navVC setSelectedView:picks];
	[[appDelegate navigationController] popToViewController:navVC animated:YES];
}

- (void) settingsButtonWasPressed:(id) button
{
	oscarsAppDelegate *appDelegate = (oscarsAppDelegate*)[[UIApplication sharedApplication] delegate];
	NavigationViewController *navVC = (NavigationViewController*)[[[appDelegate navigationController] viewControllers] objectAtIndex:1];
	[navVC setSelectedView:settings];
	[[appDelegate navigationController] popToViewController:navVC animated:YES];
}

- (void)dealloc {
	[btnGroups release];
	[btnPicks release];
	[btnSettings release];
    [super dealloc];
}


@end
