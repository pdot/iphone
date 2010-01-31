#import "AddLeagueViewController.h"
#import "CreateLeagueViewController.h"
#import "JoinLeagueViewController.h"


@implementation AddLeagueViewController

-(IBAction) cancelButtonWasPressed {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction) createButtonWasPressed {
	CreateLeagueViewController *vc = [[[CreateLeagueViewController alloc] initWithNibName:@"CreateLeagueViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}

-(IBAction) joinButtonWasPressed {
	JoinLeagueViewController *vc = [[[JoinLeagueViewController alloc] initWithNibName:@"JoinLeagueViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}


@end
