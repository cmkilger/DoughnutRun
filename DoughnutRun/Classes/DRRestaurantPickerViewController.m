//
// DRRestaurantPickerViewController.m
// DoughnutRun
//
// Created by Josef Salyer on 6/10/10.
// Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DRRestaurantPickerViewController.h"
#import "DRDataManager.h"
#import "DRRestaurant.h"
#import "DRReceiptSummaryViewController.h"
#import "DRRestaurantCell.h"


@implementation DRRestaurantPickerViewController

@synthesize fetchedResultsController, loadedCell;

#pragma mark -
#pragma mark Initialization

#pragma mark -
#pragma mark View

- (void) viewDidLoad {
    [super viewDidLoad];
	
	// Assures that the fetched results controller is set and performs the inital fetch
    NSError * error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"error: %@", [error localizedDescription]);
    }
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString * CellIdentifier = @"RestaurantCell";

    DRRestaurantCell * cell = (DRRestaurantCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
		// Load the cell from the nib
        [[NSBundle mainBundle] loadNibNamed:@"DRRestaurantCell" owner:self options:nil];
        cell = loadedCell;
    }

	// Set all the cell attributes for this restaurant
    DRRestaurant * restaurant = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.logo.image = [UIImage imageNamed:restaurant.imageFile];
    cell.phone.text = restaurant.phone;
    cell.name.text = restaurant.name;

    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DRReceiptSummaryViewController * receiptSummaryViewController = [[DRReceiptSummaryViewController alloc] initWithNibName:@"DRReceiptSummaryViewController" bundle:nil];
    receiptSummaryViewController.view.frame = self.view.bounds;
    [self.view addSubview:receiptSummaryViewController.view];
    [receiptSummaryViewController release];
}

#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *) fetchedResultsController {
	// Return it if it already exists
    if (fetchedResultsController)
        return fetchedResultsController;
	
	// Get data manager
	DRDataManager * dataManager = [DRDataManager sharedDataManager];

    // Create the fetch request for the entity.
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Restaurant" inManagedObjectContext:[dataManager managedObjectContext]];
    [fetchRequest setEntity:entity];

    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];

    // Edit the sort key as appropriate.
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray * sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];

    [fetchRequest setSortDescriptors:sortDescriptors];

    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController * aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
																								 managedObjectContext:[dataManager managedObjectContext]
																								   sectionNameKeyPath:nil
																											cacheName:@"Restaurants"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

	// Cleanup
    [aFetchedResultsController release];
    [fetchRequest release];
    [sortDescriptor release];
    [sortDescriptors release];

    return fetchedResultsController;
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark Memory management

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewDidUnload {
	self.fetchedResultsController = nil;
	self.loadedCell = nil;
}

- (void) dealloc {
    [loadedCell release];
    [fetchedResultsController release];
    [super dealloc];
}


@end

