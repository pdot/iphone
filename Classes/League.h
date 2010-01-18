#import "ObjectiveResource.h"

@interface League : NSObject {
	NSString *leagueId;
	NSString *name;
	NSString *passcode;
	NSString *description;
	NSDate   *updatedAt;
	NSDate   *createdAt;	
}

@property (nonatomic , retain) NSString *leagueId;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *description;
@property (nonatomic , retain) NSString *passcode;
@property (nonatomic , retain) NSDate   *createdAt;
@property (nonatomic , retain) NSDate   *updatedAt;

@end
