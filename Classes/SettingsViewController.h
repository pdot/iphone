//
//  SettingsViewController.h
//  oscars
//
//  Created by Jason Whyne on 30/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDNavBar.h"

@interface SettingsViewController : UIViewController {
	PDNavBar *navBar;
}

@property (retain, nonatomic) PDNavBar *navBar;

@end
