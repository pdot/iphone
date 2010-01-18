#import "AddLeagueViewController.h"
#import "League.h"

@implementation AddLeagueViewController

@synthesize txtName, txtPasscode, txtDescription;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Create League";
    }
    return self;
}

-(IBAction) cancelButtonWasPressed {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction) createButtonWasPressed {
	League * league = [[[League alloc] init] autorelease];
	league.name = txtName.text;
	league.passcode = txtPasscode.text;
	league.description = txtDescription.text;
	// TODO: add league.valdate call that returns an error message if the league is invalid
	NSError *error = nil;
	[league createRemoteWithResponse:&error];
	if (error == nil) 
	{
		[[[[UIAlertView alloc] initWithTitle:@"Success" message:@"Group was successfully created." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease] show];
		[self.navigationController popViewControllerAnimated:YES];
	}
	else
	{
		[[[[UIAlertView alloc] initWithTitle:@"Uh oh" message:@"There was an error creating your group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease] show];		
	}
	
}

- (IBAction)hideKeyboard:(id)sender {
	[txtName resignFirstResponder];
	[txtPasscode resignFirstResponder];
	[txtDescription resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[txtName release];
	[txtPasscode release];
	[txtDescription release];
    [super dealloc];
}


@end
