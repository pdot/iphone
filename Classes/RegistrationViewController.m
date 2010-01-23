// TODO: animate text fields so that keyboard doesn't cover them http://stackoverflow.com/questions/1247113/iphone-keyboard-covers-text-field

#import "RegistrationViewController.h"
#import "User.h"

@implementation RegistrationViewController

@synthesize txtLogin, txtEmail, txtPassword, txtPasswordConfirmation;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Signup";
    }
    return self;
}

- (IBAction) onRegisterButtonPress: (id) sender {
	// TODO: add more error handling / info messages
	NSString *login = txtLogin.text;
	NSString *email = txtEmail.text;
	NSString *password = txtPassword.text;
	NSString *passwordConfirmation = txtPasswordConfirmation.text;
	
	if( ([login length] > 0) && ([email length] > 0) && ([password length] > 0) && ([passwordConfirmation length] > 0) )
	{		
		User *user = [[[User alloc] init] autorelease];
		user.password = password;
		user.password_confirmation = passwordConfirmation;
		user.login = login;
		user.email = email;
		// create new user
		NSError *error = nil;
		[user createRemoteWithResponse:&error];
		if (error == nil) {
			// successful
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Registration Successful" message:@"Please check your email to activate your account." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
			[alert show];
			[self.navigationController popViewControllerAnimated:YES];
		} else {
			// other error
			NSLog(@"ERROR: %@", error);
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:@"TODO: Handle this error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] autorelease];
			[alert show];
		} 
	}
}

- (IBAction) onCancelButtonPress: (id) sender {
	[self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)hideKeyboard:(id)sender {
	[txtLogin resignFirstResponder];
	[txtEmail resignFirstResponder];
	[txtPassword resignFirstResponder];
	[txtPasswordConfirmation resignFirstResponder];
}

- (void)dealloc {
    [super dealloc];
}


@end
