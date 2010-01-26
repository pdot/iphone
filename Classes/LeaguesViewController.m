#import "LeaguesViewController.h"
#import "League.h"
#import "AwardsViewController.h"
#import "AddLeagueViewController.h"
#import "PDTextField.h"
@implementation LeaguesViewController

@synthesize tableView, leagues;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Leagues";
    }
    return self;
}
- (void) viewDidLoad {
//	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonWasPressed)]; 
	
	// Setting the text
	PDTextField* myTextField = [[PDTextField alloc] initWithFrame:CGRectMake(50, 50, 200, 40)];	
	[myTextField setPlaceholder:@"Password"];
	[[self view] addSubview:myTextField];
}

- (void) loadLeagues {
	self.leagues = [League findAllRemote];
	[tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
	[self loadLeagues];
}

-(IBAction) addButtonWasPressed {
	AddLeagueViewController *vc = [[[AddLeagueViewController alloc ] initWithNibName:@"AddLeagueViewController" bundle:nil ] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [leagues count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.text = ((League *)[leagues objectAtIndex:indexPath.row]).name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	AwardsViewController *avc = [[[AwardsViewController alloc] initWithNibName:@"AwardsViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:avc animated:YES];		
}

- (void)dealloc {
	[leagues release];
	[tableView release];
    [super dealloc];
}


@end
