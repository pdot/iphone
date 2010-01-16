#import "ObjectiveResource.h"

@interface Award : NSObject {
	NSString *name;
	NSString *description;
	NSString *AwardId;
	NSDate   *updatedAt;
	NSDate   *createdAt;
  
}

@property (nonatomic , retain) NSDate * createdAt;
@property (nonatomic , retain) NSDate * updatedAt;
@property (nonatomic , retain) NSString  *AwardId;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *description;

//-(NSArray *) findAllDogs;
//-(NSArray *) findAllDogsWithResponse:(NSError **)aError;
@end
