//
//  PDNavBar.h
//  oscars
//
//  Created by Jason Whyne on 30/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PDNavBar : UIView {
	UIButton * btnGroups;
	UIButton * btnPicks;
	UIButton * btnSettings;
}

@property (retain, nonatomic) UIButton *btnGroups;
@property (retain, nonatomic) UIButton *btnPicks;
@property (retain, nonatomic) UIButton *btnSettings;

- (void) groupsButtonWasPressed:(id) button;
- (void) picksButtonWasPressed:(id) button;
- (void) settingsButtonWasPressed:(id) button;


@end
