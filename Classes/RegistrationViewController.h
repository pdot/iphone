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
	IBOutlet PDTextField *txtLogin;
	IBOutlet PDTextField *txtEmail;
	IBOutlet PDTextField *txtPassword;
	IBOutlet PDTextField *txtPasswordConfirmation;
}

@property(nonatomic , retain) PDTextField *txtLogin;
@property(nonatomic , retain) PDTextField *txtEmail;
@property(nonatomic , retain) PDTextField *txtPassword;
@property(nonatomic , retain) PDTextField *txtPasswordConfirmation;

- (IBAction) onRegisterButtonPress: (id) sender;
- (IBAction) onCancelButtonPress: (id) sender;
- (IBAction) hideKeyboard:(id)sender;

@end
