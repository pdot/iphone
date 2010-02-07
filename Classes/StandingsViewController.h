#import <UIKit/UIKit.h>
#import "League.h"
#import "PDNavBar.h"

@interface StandingsViewController : UIViewController {
	IBOutlet UITableView *tableView;
	IBOutlet UIScrollView *scrollView;
	NSArray *standings;
	League *league;
	PDNavBar *navBar;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSArray *standings;
@property (nonatomic, retain) League *league;
@property (nonatomic, retain) PDNavBar *navBar;

- (void) loadStandings;

@end
