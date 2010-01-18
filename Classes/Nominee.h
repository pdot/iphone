//
//  Dog.h
//  active_resource
//
//  Created by vickeryj on 8/21/08.
//  Copyright 2008 Joshua Vickery. All rights reserved.
//

#import "ObjectiveResource.h"

@interface Nominee : NSObject {
	NSString *nomineeId;
	//NSString *awardId;
	NSString *name;
	NSString *description;
	NSString *movie_name;
	NSString *first_name;
	NSString *last_name;
	NSDate   *createdAt;
	NSDate   *updatedAt;
}

@property (nonatomic , retain) NSString *nomineeId;
//@property (nonatomic , retain) NSString *awardId;
@property (nonatomic , retain) NSString *name;
@property (nonatomic , retain) NSString *description;
@property (nonatomic , retain) NSString *movie_name;
@property (nonatomic , retain) NSString *first_name;
@property (nonatomic , retain) NSString *last_name;
@property (nonatomic , retain) NSDate *createdAt;
@property (nonatomic , retain) NSDate *updatedAt;

@end
