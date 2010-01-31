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
		[self.navigationController popViewControllerAnimated:YES];
		//[self.navigationController popToViewController:self.parentViewController animated:YES]; TODO: get this working
		
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
	txtName = nil;
}

@end