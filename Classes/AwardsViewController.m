#import "AwardsViewController.h"
#import "Award.h"
#import "NomineesViewController.h"
#import "NavigationViewController.h"
#import "PDButton.h"

@interface AwardsViewController (Private)

- (void) loadAwards;

@end


@implementation AwardsViewController
@synthesize awards , scrollView, navBar;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// add bottom navigation bar 
		self.navBar = [[[PDNavBar alloc] initWithFrame:CGRectMake(0, 400, 320, 460)] autorelease];
		[self.view addSubview:navBar];
		
		[self loadAwards];
		// add buttons for each award category
		for (int i = 0; i < [awards count]; i++)
		{
			Award *award = (Award*)[awards objectAtIndex:i];
			PDButton* button = [[[PDButton alloc] initWithFrame:CGRectMake(20.0, (40.0 * i) + 70.0, 280.0, 31.0)] autorelease];
			[button setTitle:award.name forState:UIControlStateNormal];
			[button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
			button.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
			button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
			button.award = award;
			[button addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];

			[scrollView addSubview:button];
		}
		
		[scrollView setContentSize:CGSizeMake(320, (40.0 * [awards count]) + 110.0)];
    }
    return self;
}

-(IBAction) buttonWasPressed:(PDButton*) sender  {
		NomineesViewController *nvc = [[[NomineesViewController alloc] initWithAward:sender.award] autorelease];
		[self.navigationController pushViewController:nvc animated:YES];		
}

- (void) loadAwards {
	self.awards = [Award findAllRemote];
}

- (void) viewDidUnload
{
	self.awards = nil;
	self.navBar = nil;
	self.scrollView = nil;
}

- (void)dealloc {
	[awards release];
	[scrollView release];
	[super dealloc];
}


@end

