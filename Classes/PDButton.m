//
//  PDButton.m
//  oscars
//
//  Created by Jason Whyne on 24/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PDButton.h"


@implementation PDButton

- (void)awakeFromNib {
	[super awakeFromNib];
	[self setBackgroundImage:[UIImage imageNamed:@"bg_uitextfield.png"] forState:UIControlStateNormal];
	[self setTitleColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0] forState:UIControlStateNormal];
}

@end
