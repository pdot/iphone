//
//  PDButton.h
//  oscars
//
//  Created by Jason Whyne on 24/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Award.h"

@interface PDButton : UIButton {
	Award *award;		// HACK for awards view controller 
}

@property (nonatomic, retain) Award *award;

@end
