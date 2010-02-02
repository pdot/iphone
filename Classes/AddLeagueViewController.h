#import <UIKit/UIKit.h>
#import "PDNavBar.h"

@interface AddLeagueViewController : UIViewController {
	PDNavBar	*navBar;
}

@property (nonatomic, retain) PDNavBar	*navBar;

-(IBAction) createButtonWasPressed;
-(IBAction) joinButtonWasPressed;

@end
