#import "CreateLeagueViewController.h"
#import "League.h"

@implementation CreateLeagueViewController

@synthesize txtName;

-(IBAction) cancelButtonWasPressed {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction) createButtonWasPressed {
	League * league = [[[League alloc] init] autorelease];
	league.name = txtName.text;

	// TODO: add league.valdate call that returns an error message if the league is invalid
	NSError *error = nil;
	[league createRemoteWithResponse:&error];
	if (error == nil) 
	{
		[[[[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"Your pool was successfully created. Your invitation code is %@", league.passcode] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease] show];
		NSArray *viewControllers = [[self navigationController] viewControllers];
		[[self navigationController] popToViewController:[viewControllers objectAtIndex:1] animated:YES];	
	}
	else
	{
		[[[[UIAlertView alloc] initWithTitle:@"Uh oh" message:@"There was an error creating your pool." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease] show];		
	}
}

- (IBAction) hideKeyboard:(id)sender {
	[txtName resignFirstResponder];
}

- (void) viewDidUnload {
	self.txtName = nil;
}

@end