//
//  CreateLeagueViewController.h
//  oscars
//
//  Created by Jason Whyne on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CreateLeagueViewController : UIViewController {
	IBOutlet UITextField *txtName;
}

@property (nonatomic, retain) UITextField * txtName;

- (IBAction) cancelButtonWasPressed;
- (IBAction) createButtonWasPressed;
- (IBAction) hideKeyboard:(id)sender;

@end
