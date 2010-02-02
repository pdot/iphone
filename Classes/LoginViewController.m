//
//  LoginViewController.m
//  oscars
//
//  Created by Jason Whyne on 16/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "ObjectiveResource.h"
#import "AwardsViewController.h"
#import "RegistrationViewController.h"
#import "NavigationViewController.h"
#import "LeaguesViewController.h"
#import "Award.h"

@implementation LoginViewController

@synthesize btnLogin, btnRegister, txtLogin, txtPassword, scrollView;

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	// TODO: remove this
	NavigationViewController *vc = [[[NavigationViewController alloc] init] autorelease];
//	RegistrationViewController *vc = [[[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
	
	// register keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];	
	
	[scrollView setContentSize:CGSizeMake(320,460)]; 
}

- (IBAction) onLoginButtonPress: (id) sender { 
	NSString *userName = [txtLogin.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSString *password = [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; // TODO: fix this
	
	if([userName length] > 0 && [password length] > 0)  // TODO: improve this check
	{
		[ObjectiveResourceConfig setUser:userName];
		[ObjectiveResourceConfig setPassword:password];
		NSError *error = nil;
		[Award findAllRemoteWithResponse:&error];
		if (error == nil) {
			// successful
			LeaguesViewController *lvc = [[[LeaguesViewController alloc] initWithNibName:@"LeaguesViewController" bundle:nil] autorelease];
			[self.navigationController pushViewController:lvc animated:YES];
		} else if (error.code == 401) {
			// login failed
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Please enter a valid user name and password." delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:@"Register", nil] autorelease];
			[alert show];
		} else {
			// other error
			UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"" message:@"TODO: Handle this error" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] autorelease];
			[alert show];
		} 
	}
	else
	{
		// TODO: print error message
	}
}

- (IBAction) onRegisterButtonPress: (id) sender { 
	RegistrationViewController *rvc = [[[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:rvc animated:YES];
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
	if (sender == txtPassword)
	{
		[sender resignFirstResponder];
	}
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if (textField == txtLogin) 
	{
		[txtPassword becomeFirstResponder];
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
	self.btnLogin = nil;
	self.btnRegister = nil;
	self.txtLogin = nil;
	self.txtPassword = nil;
	self.scrollView = nil;
}


@end
