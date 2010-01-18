//
//  RegistrationViewController.h
//  oscars
//
//  Created by Jason Whyne on 17/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegistrationViewController : UIViewController {
	IBOutlet UITextField *txtLogin;
	IBOutlet UITextField *txtEmail;
	IBOutlet UITextField *txtPassword;
	IBOutlet UITextField *txtPasswordConfirmation;
}

@property(nonatomic , retain) UITextField *txtLogin;
@property(nonatomic , retain) UITextField *txtEmail;
@property(nonatomic , retain) UITextField *txtPassword;
@property(nonatomic , retain) UITextField *txtPasswordConfirmation;

- (IBAction) onRegisterButtonPress: (id) sender;
- (IBAction) onCancelButtonPress: (id) sender;
- (IBAction) hideKeyboard:(id)sender;

@end
