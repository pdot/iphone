#import "ObjectiveResource.h"

@interface Award : NSObject {
	NSString *name;
	NSString *description;
	NSString *awardId;
	NSDate   *updatedAt;
	NSDate   *createdAt;
  
}

@property (nonatomic , retain) NSDate * createdAt;
@property (nonatomic , retain) NSDate * updatedAt;
@property (nonatomic , retain) NSString  *awardId;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *description;

-(NSArray *) findAllNominees;
-(NSArray *) findAllNomineesWithResponse:(NSError **)aError;
@end
