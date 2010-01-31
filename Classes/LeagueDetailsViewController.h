//
//  LeagueDetailsViewController.h
//  oscars
//
//  Created by Jason Whyne on 28/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "League.h"

@interface LeagueDetailsViewController : UIViewController {
	League	*league;
	IBOutlet UILabel	*lblPoolName;
}

@property (nonatomic, retain) League	*league;
@property (nonatomic, retain) UILabel	*lblPoolName;

- (id)initWithLeague:(League*) l;
- (IBAction) cancelButtonWasPressed;
- (IBAction) inviteButtonWasPressed;
- (IBAction) leavePoolButtonWasPressed;

@end
