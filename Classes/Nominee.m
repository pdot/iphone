#import "Nominee.h"
#import "ObjectiveResource.h"

@interface Nominee ()

-(NSString *) nestedPath;

@end



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

//- (BOOL)createRemoteWithResponse:(NSError **)aError {
//	return [self createRemoteAtPath:[[self class] getRemoteElementPath:[self nestedPath]] withResponse:aError];
//}
//
//- (BOOL)updateRemoteWithResponse:(NSError **)aError {
//	return [self updateRemoteAtPath:[[self class] getRemoteElementPath:[self nestedPath]] withResponse:aError];	
//}
//
//- (BOOL)destroyRemoteWithResponse:(NSError **)aError {
//	return [self destroyRemoteAtPath:[[self class] getRemoteElementPath:[self nestedPath]] withResponse:aError];
//}
//
//
//-(NSString *) nestedPath {
//	NSString *path = [NSString stringWithFormat:@"%@/nominees",awardId,nil];
//	if(nomineeId) {
//		path = [path stringByAppendingFormat:@"/%@",nomineeId,nil];
//	}
//	return path;
//}

@end
