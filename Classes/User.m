#import "User.h"


@implementation User

@synthesize login, email, password, password_confirmation, score;

- (void) dealloc
{
	[login release];
	[email release];
	[password release];
	[password_confirmation release];
	[score release];
	[super dealloc];
}

#pragma mark ObjectiveResource overrides to handle nestd resources

+ (NSString *)getRemoteCollectionName {
	return @"users";
}

@end
