#import "AwardsViewController.h"
#import "Award.h"

@interface AwardsViewController (Private)

- (void) loadAwards;

@end


@implementation AwardsViewController
@synthesize Awards , tableView;

- (void)viewWillAppear:(BOOL)animated {
	[self loadAwards];
}

- (void) loadAwards {
	self.Awards = [Award findAllRemote];
	[tableView reloadData];
}

-(IBAction) refreshButtonWasPressed {
	[self loadAwards];
}

//-(IBAction) addButtonWasPressed {
//	AddAwardViewController *aController = [[[AddAwardViewController alloc ] initWithNibName:@"AddAwardView" bundle:nil ] autorelease];
//	aController.Award = [[Award alloc] init];
//	aController.delegate = self;
//	[self.navigationController pushViewController:aController animated:YES];
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Awards count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.text = ((Award *)[Awards objectAtIndex:indexPath.row]).name;
    return cell;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	ViewAwardController *aController = [[[ViewAwardController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
//	aController.Award = (Award *)[Awards objectAtIndex:indexPath.row];
//	[self.navigationController pushViewController:aController animated:YES];
//}

- (void)tableView:(UITableView *)aTableView  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath { 
  [aTableView beginUpdates]; 
  if (editingStyle == UITableViewCellEditingStyleDelete) { 
		
    [aTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES]; 
		
    // Deletes the object on the resource
    [(Award *)[Awards objectAtIndex:indexPath.row] destroyRemote];
    [Awards removeObjectAtIndex:indexPath.row];
  } 
  [aTableView endUpdates];   
}


- (void)dealloc {
	[Awards release];
  [super dealloc];
}


@end

