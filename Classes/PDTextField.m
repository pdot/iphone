#import "PDTextField.h"


@implementation PDTextField

- (id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {	

    }
    return self;
}
		 
- (void)awakeFromNib {
	[super awakeFromNib];
	[self setFont:[UIFont fontWithName:@"Arial" size:16]];
	[self setTextColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
	self.borderStyle = UITextBorderStyleNone;
	[self setBackground:[UIImage imageNamed:@"bg_uitextfield.png"]];
	self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	
	UIView *leftView = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 5.0f, self.bounds.size.height)] autorelease];
	self.leftViewMode = UITextFieldViewModeAlways;
	self.leftView = leftView;			
}
@end
