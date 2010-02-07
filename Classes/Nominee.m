#import "Nominee.h"
#import "ObjectiveResource.h"

@implementation Nominee

@synthesize nomineeId, name, description, movie_name, first_name, last_name, createdAt, updatedAt;

- (void) dealloc
{
//	[awardId release];
	[nomineeId release];
	[name release];
	[description release];
	[movie_name release];
	[first_name release];
	[last_name release];
	[createdAt release];
	[updatedAt release];
	[super dealloc];
}

#pragma mark ObjectiveResource overrides to handle nestd resources

+ (NSString *)getRemoteCollectionName {
	return @"awards";
}


@end
