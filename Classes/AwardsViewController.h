#import <UIKit/UIKit.h>

@interface AwardsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *Awards;
	IBOutlet UITableView *tableView;
  IBOutlet UIBarButtonItem * addButton;
}

@property (nonatomic , retain) NSArray* Awards;
-(IBAction) refreshButtonWasPressed;
//-(IBAction) addButtonWasPressed;
@property(nonatomic , retain) UITableView *tableView;

@end
