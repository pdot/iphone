#import "League.h"
#import "ObjectiveResource.h"
#import "Nominee.h"

@implementation League 
@synthesize createdAt, updatedAt, name, description, leagueId, passcode;


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"leagues";
}

- (void) dealloc
{
	[createdAt release];
	[updatedAt release];
	[name release];
	[leagueId release];
	[description release];
	[super dealloc];
}

@end
