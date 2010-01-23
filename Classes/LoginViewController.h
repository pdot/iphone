//
//  LoginViewController.h
//  oscars
//
//  Created by Jason Whyne on 16/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController<UIScrollViewDelegate> {
	IBOutlet UIButton *btnLogin;
	IBOutlet UIButton *btnRegister;
	IBOutlet UITextField *txtLogin;
	IBOutlet UITextField *txtPassword;
	IBOutlet UIScrollView *scrollView;
	BOOL keyboardShown;
}

@property(nonatomic , retain) UIButton *btnLogin;
@property(nonatomic , retain) UIButton *btnRegister;
@property(nonatomic , retain) UITextField *txtLogin;
@property(nonatomic , retain) UITextField *txtPassword;
@property(nonatomic , retain) UIScrollView *scrollView;

- (IBAction) onLoginButtonPress: (id) sender;
- (IBAction) onRegisterButtonPress: (id) sender;
- (IBAction) editingDidEndOnExit:(id)sender;
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField;

@end
