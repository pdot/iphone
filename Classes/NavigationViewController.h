//
//  NavigationViewController.h
//  oscars
//
//  Created by Jason Whyne on 30/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
	groups,
	picks,
	settings
} SelectedView;

@interface NavigationViewController : UIViewController {
	SelectedView selectedView;
}

- (void)setSelectedView:(SelectedView)view;

@end
