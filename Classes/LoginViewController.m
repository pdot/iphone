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
#import "LeaguesViewController.h"
#import "Award.h"

@implementation LoginViewController

@synthesize btnLogin, btnRegister, txtLogin, txtPassword;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:@"LoginViewController" bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Login";
    }
    return self;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
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

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(buttonIndex == 1)
	{
		// registration button was clicked
		[self onRegisterButtonPress:self];
	}
}

//- (void)displayMessage: (NSString*) msg {
//	UIAlertView* dialog = [[[UIAlertView alloc] init] retain];
//	[dialog setDelegate:self];
//	[dialog setTitle:@""];
//	
//	[dialog setMessage:msg];
//	[dialog addButtonWithTitle:@"OK"];
//	[dialog addTextFieldWithValue:@"name" label:@""];
//	CGAffineTransform moveUp = CGAffineTransformMakeTranslation(0.0, 100.0);
//	[dialog setTransform: moveUp];
//	[dialog show];
//	[dialog release];	
//}


- (void)dealloc {
	[btnLogin release];
	[btnRegister release];
	[txtLogin release];
	[txtPassword release];
    [super dealloc];
}


@end
