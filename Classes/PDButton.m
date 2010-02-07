//
//  PDButton.m
//  oscars
//
//  Created by Jason Whyne on 24/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PDButton.h"


@implementation PDButton

@synthesize award;

- (void) setCustomProperties 
{
	UIImage *buttonBackground = [UIImage imageNamed:@"bg_uitextfield.png"];
	buttonBackground = [buttonBackground stretchableImageWithLeftCapWidth:250 topCapHeight:20 ];
	[self setBackgroundImage:buttonBackground forState:UIControlStateNormal];
	[self setTitleColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0] forState:UIControlStateNormal];
	[self setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] forState:UIControlStateHighlighted];
}

- (id)initWithFrame:(CGRect)frame {
	
    if (self = [super initWithFrame:frame]) {
		[self setCustomProperties];
    }
    return self;
}


- (void)awakeFromNib {
	[super awakeFromNib];
	[self setCustomProperties];
}

- (void) dealloc
{
	self.award = nil;
	[super dealloc];
}

@end
