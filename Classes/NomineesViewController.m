//
//  NomineeViewController.m
//  active_resource
//
//  Created by vickeryj on 8/21/08.
//  Copyright 2008 Joshua Vickery. All rights reserved.
//

#import "NomineesViewController.h"
#import "Nominee.h"
#import "Award.h"

@interface NomineesViewController (Private)
	- (void) loadNominees;
@end


@implementation NomineesViewController

@synthesize nominees, tableView, category;

- (id)initWithAward:(Award*) a {
    if (self = [super initWithNibName:@"NomineesViewController" bundle:nil]) {
		self.category = a;
    }
    return self;
}

- (void)viewDidLoad {
	self.editing = YES;
	[tableView setEditing:YES animated:NO];
}

- (void) loadNominees {
	self.nominees = [category findAllNominees];
	[tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	[self loadNominees];
}

- (void)viewWillDisappear:(BOOL)animated {
		[self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [nominees count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellId = @"cellId";
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:cellId];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	}
	cell.text = ((Nominee *)[nominees objectAtIndex:indexPath.row]).name;
	cell.showsReorderControl = YES; 
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

// Determine whether a given row is eligible for reordering or not.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// Process the row move. This means updating the data model to correct the item indices.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath {
	
}

#pragma mark cleanup
- (void)dealloc {
  
	[tableView release];
	[nominees release];
	[super dealloc];

}


@end
