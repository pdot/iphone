//
//  LeagueDetailsViewController.m
//  oscars
//
//  Created by Jason Whyne on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LeagueDetailsViewController.h"


@implementation LeagueDetailsViewController

@synthesize league, lblPoolName;

- (id)initWithLeague:(League*) l {
    if (self = [super initWithNibName:@"LeagueDetailsViewController" bundle:nil]) {
		self.league = l;
    }
    return self;
}

-(IBAction) inviteButtonWasPressed {
	NSString *url = [NSString stringWithString: @"mailto:foo@example.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!"];
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
}

-(IBAction) cancelButtonWasPressed {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction) leavePoolButtonWasPressed {
	// show warning message
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Leave Pool" message:@"Are you sure that you want to leave this pool?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil] autorelease];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	if (buttonIndex == 1)
	{
		// attempt to leave pool
		NSError *error = nil;
		[league destroyRemoteWithResponse:&error];
		if (error == nil)
		{
			[self.navigationController popViewControllerAnimated:YES];
		}
		else
		{
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error Leaving Pool" message:@"TODO: Write better copy here" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
			[alert show];
		}
	}
}


- (void)viewDidLoad {
	lblPoolName.text = league.name;
    [super viewDidLoad];
}

- (void)viewDidUnload {
	self.lblPoolName = nil;
	self.league = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
