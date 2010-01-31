#import "JoinLeagueViewController.h"
#import "League.h"

@implementation JoinLeagueViewController

@synthesize txtPasscode;

-(IBAction) cancelButtonWasPressed {
	[self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)joinButtonWasPressed {
	BOOL success = [League join:txtPasscode.text];
	if (success) 
	{
		// TODO: pop twice
		[self.navigationController popViewControllerAnimated:YES];
	}
	else
	{
		[[[[UIAlertView alloc] initWithTitle:@"Error joining pool" message:[NSString stringWithFormat:@"Please check your confirmation code and try again."] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease] show];
	}
}

- (IBAction) editingDidEndOnExit:(id)sender {
	if (sender == txtPasscode) 
	{
		[txtPasscode resignFirstResponder];
	} 

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if (textField == txtPasscode) 
	{
		[txtPasscode resignFirstResponder];
	}
}

- (void) viewDidUnload {
	txtPasscode = nil;
}


@end
