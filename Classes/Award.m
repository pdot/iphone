#import "Award.h"
#import "ObjectiveResource.h"
#import "Nominee.h"

@implementation Award 
@synthesize createdAt, updatedAt, name, description, awardId;


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"awards";
}


// this will go to the url http://RAILS_URL/awards/<id>/nominees
// and return the array of nominees
-(NSArray *) findAllNominees {
	return [Nominee findRemote:[NSString stringWithFormat:@"%@/%@",awardId,@"nominees",nil]];
}

-(NSArray *) findAllNomineesWithResponse:(NSError **)aError {
	return [Nominee findRemote:[NSString stringWithFormat:@"%@/%@",awardId,@"nominees",nil] withResponse:aError];
}

- (void) dealloc
{
	[createdAt release];
	[updatedAt release];
	[name release];
	[awardId release];
	[description release];
	[super dealloc];
}

@end
