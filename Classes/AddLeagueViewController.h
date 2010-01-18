//
//  AddLeagueViewController.h
//  oscars
//
//  Created by Jason Whyne on 18/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddLeagueViewController : UIViewController {
	IBOutlet UITextField *txtName;
	IBOutlet UITextField *txtPasscode;
	IBOutlet UITextField *txtDescription;
}

@property (nonatomic, retain) UITextField *txtName;
@property (nonatomic, retain) UITextField *txtPasscode;
@property (nonatomic, retain) UITextField *txtDescription;

-(IBAction) cancelButtonWasPressed;
-(IBAction) createButtonWasPressed;

- (IBAction)hideKeyboard:(id)sender;

@end
