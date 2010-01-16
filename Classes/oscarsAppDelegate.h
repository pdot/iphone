//
//  oscarsAppDelegate.h
//  oscars
//
//  Created by Jason Whyne on 14/01/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwardsViewController.h"

@interface oscarsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	AwardsViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

