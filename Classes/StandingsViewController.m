//
//  StandingsViewController.m
//  oscars
//
//  Created by Jason Whyne on 31/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StandingsViewController.h"


@implementation StandingsViewController

@synthesize tableView, scrollView;

- (void)viewDidLoad {
	tableView.separatorColor = [UIColor grayColor];
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, tableView.rowHeight*[tableView numberOfRowsInSection:0]);
	scrollView.contentSize = CGSizeMake(320, tableView.frame.size.height+100);
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	const NSInteger TOP_LABEL_TAG = 1001;
	const NSInteger BOTTOM_LABEL_TAG = 1002;
	UILabel *topLabel;
	UILabel *bottomLabel;
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//cell.clipsToBounds = YES;

	if (cell == nil)
	{
		//
		// Create the cell.
		//
		cell =
		[[[UITableViewCell alloc]
		  initWithFrame:CGRectZero
		  reuseIdentifier:CellIdentifier]
		 autorelease];
		
		UIImage *indicatorImage = [UIImage imageNamed:@"indicator.png"];
		cell.accessoryView =
		[[[UIImageView alloc]
		  initWithImage:indicatorImage]
		 autorelease];
		
		UIImage *image = [UIImage imageNamed:@"imageA.png"];
		
		const CGFloat LABEL_HEIGHT = 20;
		
		//
		// Create the label for the top row of text
		//
		topLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.0,//5 * (aTableView.rowHeight - 2 * LABEL_HEIGHT),
					 aTableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:topLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		topLabel.tag = TOP_LABEL_TAG;
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
		topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		//
		// Create the label for the top row of text
		//
//		bottomLabel =
//		[[[UILabel alloc]
//		  initWithFrame:
//		  CGRectMake(
//					 image.size.width + 2.0 * cell.indentationWidth,
//					 0.5 * (aTableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT,
//					 aTableView.bounds.size.width -
//					 image.size.width - 4.0 * cell.indentationWidth
//					 - indicatorImage.size.width,
//					 LABEL_HEIGHT)]
//		 autorelease];
//		[cell.contentView addSubview:bottomLabel];
//		
//		//
//		// Configure the properties for the text that are the same on every row
//		//
//		bottomLabel.tag = BOTTOM_LABEL_TAG;
//		bottomLabel.backgroundColor = [UIColor clearColor];
//		bottomLabel.textColor = [UIColor whiteColor];
//		bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
//		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		
		//
		// Create a background image view.
		//
		cell.backgroundView = [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView = [[[UIImageView alloc] init] autorelease];
	}
	else
	{
		topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		//bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
	}
	
	topLabel.text = [NSString stringWithFormat:@"%ld.\tJohn Smith %ld\t\t%ld", [indexPath row], [indexPath row], [indexPath row]*5];
	//bottomLabel.text = [NSString stringWithFormat:@"Some other information.", [indexPath row]];
	
	//
	// Set the background and selected background images for the text.
	// Since we will round the corners at the top and bottom of sections, we
	// need to conditionally choose the images based on the row index and the
	// number of rows in the section.
	//
//	UIImage *rowBackground;
//	UIImage *selectionBackground;
//	NSInteger sectionRows = [aTableView numberOfRowsInSection:[indexPath section]];
//	NSInteger row = [indexPath row];
//	if (row == 0 && row == sectionRows - 1)
//	{
//		rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
//		selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
//	}
//	else if (row == 0)
//	{
//		rowBackground = [UIImage imageNamed:@"topRow.png"];
//		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
//	}
//	else if (row == sectionRows - 1)
//	{
//		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
//		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
//	}
//	else
//	{
//		rowBackground = [UIImage imageNamed:@"middleRow.png"];
//		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
//	}
	((UIImageView *)cell.backgroundView).image = [UIImage imageNamed:@"bg_uitextfield.png"];
	((UIImageView *)cell.selectedBackgroundView).image = [UIImage imageNamed:@"bg_uitextfield.png"];
	
	return cell;
}

- (void)viewDidUnload {
	self.tableView = nil;
	[super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}

@end
