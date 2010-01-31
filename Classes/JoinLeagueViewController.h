//
//  JoinLeagueViewController.h
//  oscars
//
//  Created by Jason Whyne on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JoinLeagueViewController : UIViewController {
	IBOutlet UITextField *txtPasscode;
}

@property (nonatomic, retain) UITextField *txtPasscode;

- (IBAction) cancelButtonWasPressed;
- (IBAction) joinButtonWasPressed;
- (IBAction) editingDidEndOnExit:(id)sender;

@end
