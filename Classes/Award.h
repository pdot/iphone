#import "ObjectiveResource.h"

@interface Award : NSObject {
	NSString *awardId;
	NSString *name;
	NSString *description;
	NSDate   *updatedAt;
	NSDate   *createdAt;
}

@property (nonatomic , retain) NSString *awardId;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *description;
@property (nonatomic , retain) NSDate   *createdAt;
@property (nonatomic , retain) NSDate   *updatedAt;

-(NSArray *) findAllNominees;
-(NSArray *) findAllNomineesWithResponse:(NSError **)aError;
@end
