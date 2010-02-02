#import "LeaguesViewController.h"
#import "League.h"
#import "AwardsViewController.h"
#import "AddLeagueViewController.h"
#import "PDTextField.h"
#import "LeagueDetailsViewController.h"
#import "NavigationViewController.h"

@implementation LeaguesViewController

@synthesize leagues, navBar, btnAdd, btnPool1, btnPool2, btnPool3, btnPool4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.navBar = [[[PDNavBar alloc] initWithFrame:CGRectMake(0, 400, 320, 460)] autorelease];
		[self.view addSubview:navBar];
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	[self loadLeagues];
	// TODO: figure out why leagues sometimes are not showing up on iphone
}

- (void) loadLeagues {
	btnPool1.hidden = YES;
	btnPool2.hidden = YES;
	btnPool3.hidden = YES;
	btnPool4.hidden = YES;
	
	self.leagues = [League findAllRemote];
	
	// dynamically create enough buttons
	if (self.leagues.count >= 1) {
		[btnPool1 setTitle:((League *)[leagues objectAtIndex:0]).name forState:UIControlStateNormal];
		btnPool1.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
		btnPool1.hidden = NO;
	}
	if (self.leagues.count >= 2) {
		[btnPool2 setTitle:((League *)[leagues objectAtIndex:1]).name forState:UIControlStateNormal];
		btnPool2.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
		btnPool2.hidden = NO;
	}
	if (self.leagues.count >= 3) {
		[btnPool3 setTitle:((League *)[leagues objectAtIndex:2]).name forState:UIControlStateNormal];
		btnPool3.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
		btnPool3.hidden = NO;
	}
	if (self.leagues.count == 4) {
		[btnPool4 setTitle:((League *)[leagues objectAtIndex:3]).name forState:UIControlStateNormal];
		btnPool4.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 0.0);
		btnPool4.hidden = NO;
		
	}
	
	// TODO: position add button
}


-(IBAction) poolButtonWasPressed:(UIButton*) sender {
	League *selectedLeague = nil;
	if (sender == btnPool1) {
		selectedLeague = (League*)[leagues objectAtIndex:0]; 
	} else if (sender == btnPool2) {
		selectedLeague = (League*)[leagues objectAtIndex:1]; 	
	} else if (sender == btnPool3) {
		selectedLeague = (League*)[leagues objectAtIndex:2]; 
	} else if (sender == btnPool4) {
		selectedLeague = (League*)[leagues objectAtIndex:3]; 
	}
	
	if (selectedLeague != nil) {
		LeagueDetailsViewController *vc = [[[LeagueDetailsViewController alloc ] initWithLeague:selectedLeague] autorelease];
		[self.navigationController pushViewController:vc animated:YES];	
	}
}

-(IBAction) addButtonWasPressed {
	AddLeagueViewController *vc = [[[AddLeagueViewController alloc ] initWithNibName:@"AddLeagueViewController" bundle:nil ] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidUnload {
	self.navBar = nil;
	self.leagues = nil;
	self.btnAdd = nil;
	self.btnPool1 = nil;
	self.btnPool2 = nil;
	self.btnPool3 = nil;
	self.btnPool4 = nil;
}

- (void)dealloc {
	[leagues release];
    [super dealloc];
}


@end
