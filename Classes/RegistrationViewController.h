//
//  RegistrationViewController.h
//  oscars
//
//  Created by Jason Whyne on 17/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDTextField.h"

@interface RegistrationViewController : UIViewController {
	IBOutlet UIScrollView * scrollView;
	IBOutlet PDTextField *txtFirstName;
	IBOutlet PDTextField *txtLastName;
	IBOutlet PDTextField *txtLogin;
	IBOutlet PDTextField *txtEmail;
	IBOutlet PDTextField *txtPassword;
	IBOutlet PDTextField *txtPasswordConfirmation;
	BOOL keyboardShown;
}
@property(nonatomic , retain) UIScrollView *scrollView;
@property(nonatomic , retain) PDTextField *txtFirstName;
@property(nonatomic , retain) PDTextField *txtLastName;
@property(nonatomic , retain) PDTextField *txtLogin;
@property(nonatomic , retain) PDTextField *txtEmail;
@property(nonatomic , retain) PDTextField *txtPassword;
@property(nonatomic , retain) PDTextField *txtPasswordConfirmation;

- (IBAction) editingDidEndOnExit:(id)sender;
- (IBAction) onRegisterButtonPress: (id) sender;
- (IBAction) onCancelButtonPress: (id) sender;

@end
