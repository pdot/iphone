// TODO: animate text fields so that keyboard doesn't cover them http://stackoverflow.com/questions/1247113/iphone-keyboard-covers-text-field

#import "RegistrationViewController.h"
#import "User.h"

@implementation RegistrationViewController

@synthesize scrollView, txtFirstName, txtLastName, txtLogin, txtEmail, txtPassword, txtPasswordConfirmation;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Signup";
		keyboardShown = NO;
		
		// add textfields
	
		
		// add buttons
    }
    return self;
}

- (void) viewDidLoad {
	// register keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];	
	
	[scrollView setContentSize:CGSizeMake(320,460)]; 
}
- (IBAction) onRegisterButtonPress: (id) sender {
	// TODO: add first name and last name here / perform validation / add max and min characters
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


// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    if (keyboardShown)
        return;
	
    NSDictionary* info = [aNotification userInfo];
	
    // Get the size of the keyboard.
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
	
    // Resize the scroll view (which is the root view of the window)
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardSize.height;
    scrollView.frame = viewFrame;
	
    keyboardShown = YES;
}

// Called when the UIKeyboardDidHideNotification is sent
- (void)keyboardWasHidden:(NSNotification*)aNotification
{	
    NSDictionary* info = [aNotification userInfo];
	
    // Get the size of the keyboard.
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
	
    // Reset the height of the scroll view to its original value
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height += keyboardSize.height;
    scrollView.frame = viewFrame;
    keyboardShown = NO;	
}

- (IBAction) editingDidEndOnExit:(id)sender {
	if (sender == txtFirstName) 
	{
		[txtLastName becomeFirstResponder];
	} 
	else if (sender == txtLastName) 
	{
		[txtLogin becomeFirstResponder];
	} 
	else if (sender == txtLogin) 
	{
		[txtEmail becomeFirstResponder];
	}
	else if (sender == txtEmail) 
	{
		[txtPassword becomeFirstResponder];
	}
	else if (sender == txtPassword) 
	{
		[txtPasswordConfirmation becomeFirstResponder];
	}
	else if (sender == txtPasswordConfirmation)
	{
		[sender resignFirstResponder];
	}
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if (textField == txtFirstName) 
	{
		[txtLastName becomeFirstResponder];
	} 
	else if (textField == txtLastName) 
	{
		[txtLogin becomeFirstResponder];
	} 
	else if (textField == txtLogin) 
	{
		[txtEmail becomeFirstResponder];
	}
	else if (textField == txtEmail) 
	{
		[txtPassword becomeFirstResponder];
	}
	else if (textField == txtPassword) 
	{
		[txtPasswordConfirmation becomeFirstResponder];
	}
	else if (textField == txtPasswordConfirmation)
	{
		[textField resignFirstResponder];
	}
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	// login and password validation
	if (textField.text.length < 1) {
		return NO;
	}
	return YES;
}


- (void)viewDidUnload {
	scrollView = nil;
	txtFirstName = nil;
	txtLastName = nil;
	txtLogin = nil;
	txtEmail = nil;
	txtPassword = nil;
	txtPasswordConfirmation = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
