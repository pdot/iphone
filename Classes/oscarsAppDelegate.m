//
//  oscarsAppDelegate.m
//  oscars
//
//  Created by Jason Whyne on 14/01/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "oscarsAppDelegate.h"
#import "ObjectiveResource.h"


@implementation oscarsAppDelegate

@synthesize window, navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	//Configure ObjectiveResource
	[ObjectiveResourceConfig setSite:@"http://localhost:2999/"];
	
	// dogs is password protected
	[ObjectiveResourceConfig setUser:@"jason"];
	[ObjectiveResourceConfig setPassword:@"jasonw"];
	
	// use json
	// [ObjectiveResourceConfig setResponseType:JSONResponse];
	
	// use xml
	[ObjectiveResourceConfig setResponseType:XmlResponse];
	
    // Override point for customization after application launch
	[window addSubview:navigationController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
