#import "League.h"
#import "ObjectiveResource.h"
#import "Nominee.h"

@implementation League 
@synthesize createdAt, updatedAt, name, description, leagueId, passcode;


// handle pluralization 
+ (NSString *)getRemoteCollectionName {
	return @"leagues";
}


// returns YES iff league was successfully joined
+(BOOL) join:(NSString*)passcode {
	//TODO: this is hackish fix it	
	NSError *error = nil;
	[League findRemote:[NSString stringWithFormat:@"join/%@", passcode, nil] withResponse:&error];
	return error == nil;
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
