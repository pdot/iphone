#import "Award.h"
#import "ObjectiveResource.h"

@implementation Award 
@synthesize createdAt, updatedAt, name, description, AwardId;


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"awards";
}


// this will go to the url http://RAILS_URL/people/<id>/dogs
// and return the array of dogs
//-(NSArray *) findAllDogs {
//	return [Dog findRemote:[NSString stringWithFormat:@"%@/%@",AwardId,@"dogs",nil]];
//}
//
//-(NSArray *) findAllDogsWithResponse:(NSError **)aError {
//	return [Dog findRemote:[NSString stringWithFormat:@"%@/%@",AwardId,@"dogs",nil] withResponse:aError];
//}

- (void) dealloc
{
	[createdAt release];
	[updatedAt release];
	[name release];
	[AwardId release];
	[description release];
	[super dealloc];
}

@end
