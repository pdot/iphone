#import <UIKit/UIKit.h>


@interface LeaguesViewController : UIViewController {
	NSMutableArray *leagues;
	IBOutlet UITableView *tableView;
	IBOutlet UIBarButtonItem * addButton;
}

@property (nonatomic , retain) NSArray* leagues;
@property (nonatomic , retain) UITableView *tableView;

-(IBAction) addButtonWasPressed;

@end
