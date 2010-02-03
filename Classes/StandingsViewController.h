//
//  StandingsViewController.h
//  oscars
//
//  Created by Jason Whyne on 31/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StandingsViewController : UIViewController {
	IBOutlet UITableView *tableView;
	IBOutlet UIScrollView *scrollView;
	
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
