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

//- (void) addNomineeButtonClicked {
//	Nominee	 *newNominee = [[[Nominee alloc] init] autorelease];
//	newNominee.personId = owner.personId;
//	addController.newNominee = newNominee;
//	[self.navigationController pushViewController:addController animated:YES];
//}

- (void) loadNominees {
	self.nominees = [category findAllNominees];
	[tableView reloadData];
}

#pragma mark UIViewController methods

- (void)viewDidLoad {
	self.title = category.name;
//	self.addController = [[[AddNomineeViewController alloc] initWithNibName:@"AddNomineeView" bundle:nil] autorelease];
//	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNomineeButtonClicked)]; 
}

- (void)viewWillAppear:(BOOL)animated {
	[self loadNominees];
}

#pragma mark UITableViewDataSource methods

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
	return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//  
//  ViewNomineeController * aViewNomineeController = [[ViewNomineeController alloc] initWithStyle:UITableViewStyleGrouped];
//  aViewNomineeController.nominee = [nominees objectAtIndex:indexPath.row];
//  [self.navigationController pushViewController:aViewNomineeController animated:YES];
//  [aViewNomineeController release];
//  
//}

//- (void)tableView:(UITableView *)aTableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { 
//	[tableView beginUpdates]; 
//	if (editingStyle == UITableViewCellEditingStyleDelete) { 
//		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES]; 
//
//		// Deletes the object on the resource , if the deletion is successfull YES is returned
//		[(Nominee *)[nominees objectAtIndex:indexPath.row] destroyRemote];
//		[nominees removeObjectAtIndex:indexPath.row];
//	} 
//	[tableView endUpdates];   
//}

#pragma mark cleanup
- (void)dealloc {
  
	[tableView release];
	[nominees release];
	[super dealloc];

}


@end
