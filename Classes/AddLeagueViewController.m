#import "AddLeagueViewController.h"
#import "CreateLeagueViewController.h"
#import "JoinLeagueViewController.h"


@implementation AddLeagueViewController

@synthesize navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.navBar = [[[PDNavBar alloc] initWithFrame:CGRectMake(0, 400, 320, 460)] autorelease];
		[self.view addSubview:navBar];
    }
    return self;
}

-(IBAction) createButtonWasPressed {
	CreateLeagueViewController *vc = [[[CreateLeagueViewController alloc] initWithNibName:@"CreateLeagueViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}

-(IBAction) joinButtonWasPressed {
	JoinLeagueViewController *vc = [[[JoinLeagueViewController alloc] initWithNibName:@"JoinLeagueViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidUnload {
	self.navBar = nil;
}


@end
