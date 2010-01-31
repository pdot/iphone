#import <UIKit/UIKit.h>


@interface LeaguesViewController : UIViewController {
	NSMutableArray		*leagues;
	IBOutlet UIButton	*btnAdd;
	IBOutlet UIButton	*btnPool1;
	IBOutlet UIButton	*btnPool2;
	IBOutlet UIButton	*btnPool3;
	IBOutlet UIButton	*btnPool4;
}

@property (nonatomic, retain) NSArray	*leagues;
@property (nonatomic, retain) UIButton	*btnAdd;
@property (nonatomic, retain) UIButton *btnPool1;
@property (nonatomic, retain) UIButton *btnPool2;
@property (nonatomic, retain) UIButton *btnPool3;
@property (nonatomic, retain) UIButton *btnPool4;

-(IBAction) addButtonWasPressed;
-(IBAction) poolButtonWasPressed:(UIButton*) sender;
-(void) loadLeagues;

@end
