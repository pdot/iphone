#import "StandingsViewController.h"
#import "Standing.h"

@implementation StandingsViewController

@synthesize tableView, scrollView, standings, league, navBar;

- (id)initWithLeague:(League*) l {
    if (self = [super initWithNibName:@"StandingsViewController" bundle:nil]) {
		self.navBar = [[[PDNavBar alloc] initWithFrame:CGRectMake(0, 400, 320, 460)] autorelease];
		[self.view addSubview:navBar];
		self.league = l;
		[self loadStandings];
    }
    return self;
}


- (void)viewDidLoad {
	tableView.separatorColor = [UIColor grayColor];
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, tableView.rowHeight*[tableView numberOfRowsInSection:0]);
	scrollView.contentSize = CGSizeMake(320, tableView.frame.size.height+100);
    [super viewDidLoad];
}

- (void) loadStandings
{
	NSError *error = nil;
	self.standings = [league findAllStandingsWithResponse:&error];
	[tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [standings count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	const NSInteger RANK_LABEL_TAG = 1001;
	const NSInteger NAME_LABEL_TAG = 1002;
	const NSInteger SCORE_LABEL_TAG = 1003;
	
	UILabel *lblRank;
	UILabel *lblName;
	UILabel *lblScore;
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//cell.clipsToBounds = YES;
	

	if (cell == nil)
	{
		//
		// Create the cell.
		//
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
			
		const CGFloat LABEL_HEIGHT = 20;

		// Rank Label
		lblRank = [[[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, 50.0, LABEL_HEIGHT)] autorelease];
		lblRank.tag = RANK_LABEL_TAG;
		lblRank.backgroundColor = [UIColor clearColor];
		lblRank.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
		lblRank.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		lblRank.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		[cell.contentView addSubview:lblRank];
		
		// Name label
		lblName = [[[UILabel alloc] initWithFrame: CGRectMake(45.0, 0.0, 200.0, LABEL_HEIGHT)] autorelease];		
		lblName.tag = NAME_LABEL_TAG;
		lblName.backgroundColor = [UIColor clearColor];
		lblName.textColor = [UIColor grayColor];
		lblName.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		lblName.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		[cell.contentView addSubview:lblName];
		
		//Score label
		lblScore = [[[UILabel alloc] initWithFrame: CGRectMake(230.0, 0.0, 40.0, LABEL_HEIGHT)] autorelease];		
		lblScore.tag = SCORE_LABEL_TAG;
		lblScore.backgroundColor = [UIColor clearColor];
		lblScore.textColor = [UIColor grayColor];
		lblScore.textAlignment = UITextAlignmentRight;
		lblScore.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		lblScore.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		[cell.contentView addSubview:lblScore];
		
		cell.backgroundView = [[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView = [[[UIImageView alloc] init] autorelease];
		
	}
	else
	{
		lblRank = (UILabel *)[cell viewWithTag:RANK_LABEL_TAG];
		lblName = (UILabel *)[cell viewWithTag:NAME_LABEL_TAG];
		lblScore = (UILabel *)[cell viewWithTag:SCORE_LABEL_TAG];
	}
	
	if([indexPath row] == 0)
	{
		lblRank.text = @"#";
		lblName.text = @"Name";
		lblScore.text = @"Score";
	}
	else
	{
		Standing *standing = (Standing *)[standings objectAtIndex:([indexPath row] - 1)];
		lblRank.text = [NSString stringWithFormat:@"%ld.", [indexPath row]];
		lblName.text = [NSString stringWithFormat:@"%@", standing.login];
		lblScore.text = [NSString stringWithFormat:@"%@", standing.score];
	}
	
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
	self.standings = nil;
	self.league = nil;
	self.navBar = nil;
	[super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}

@end
