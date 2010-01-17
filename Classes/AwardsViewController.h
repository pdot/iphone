#import <UIKit/UIKit.h>

@interface AwardsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *awards;
	IBOutlet UITableView *tableView;
	IBOutlet UIBarButtonItem * addButton;
}

@property (nonatomic , retain) NSArray* awards;
-(IBAction) refreshButtonWasPressed;
//-(IBAction) addButtonWasPressed;
@property(nonatomic , retain) UITableView *tableView;

@end
