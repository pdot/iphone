#import <UIKit/UIKit.h>
#import "PDNavBar.h"

@interface AwardsViewController : UIViewController {
	NSMutableArray *awards;
	PDNavBar			*navBar;
	IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain) NSArray* awards;
@property (nonatomic, retain) PDNavBar *navBar;
@property (nonatomic, retain) UIScrollView *scrollView;

-(IBAction) poolButtonWasPressed:(UIButton*) sender;

@end
