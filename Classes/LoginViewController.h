//
//  LoginViewController.h
//  oscars
//
//  Created by Jason Whyne on 16/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController {
	IBOutlet UIButton *btnLogin;
	IBOutlet UIButton *btnRegister;
	IBOutlet UITextField *txtLogin;
	IBOutlet UITextField *txtPassword;
}

@property(nonatomic , retain) UIButton *btnLogin;
@property(nonatomic , retain) UIButton *btnRegister;
@property(nonatomic , retain) UITextField *txtLogin;
@property(nonatomic , retain) UITextField *txtPassword;

- (IBAction) onLoginButtonPress: (id) sender;
- (IBAction) onRegisterButtonPress: (id) sender;
@end
