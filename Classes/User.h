#import "ObjectiveResource.h"

@interface User : NSObject {
	NSString *login;
	NSString *email;
	NSString *password;
	NSString *password_confirmation;
}

@property (nonatomic, retain) NSString *login;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *password_confirmation;

@end
