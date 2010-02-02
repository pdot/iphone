#import "NavigationViewController.h"
#import "LeaguesViewController.h"
#import "AwardsViewController.h"
#import "SettingsViewController.h"

@implementation NavigationViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // TODO: initialize groups to be initially selected
		self.view.backgroundColor = [UIColor blackColor];
		self.selectedView = groups;
    }
    return self;
}

- (void)setSelectedView:(SelectedView)view
{
    selectedView = view;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	LeaguesViewController *vc = nil;
	if (selectedView == groups)
	{
		vc = [[[LeaguesViewController alloc] initWithNibName:@"LeaguesViewController" bundle:nil] autorelease];	
	}
	else if (selectedView == picks)
	{
		vc = [[[AwardsViewController alloc] initWithNibName:@"AwardsViewController" bundle:nil] autorelease];	
	}
	else if (selectedView == settings)
	{
		vc = [[[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil] autorelease];	
	}
	[self.navigationController pushViewController:vc animated:YES];	
}

- (void)dealloc {
    [super dealloc];
}


@end
