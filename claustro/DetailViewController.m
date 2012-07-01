//
//  DetailViewController.m
//  claustro
//
//  Created by Christina on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Claustro.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController{
    NSString *_detailItem;
    Claustro *claustro;
}


#pragma mark - Managing the detail item

-(void)setDetailItem:(NSString *)newDetailItem withExtension:(BOOL)extension{
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

        if(!claustro){
            claustro = [[Claustro alloc] init];
            claustro.useExtension = extension;
        }

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (_detailItem) {
        self.title = _detailItem;

        [claustro initWithScenarioName:_detailItem];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    UIBarButtonItem *shuffleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(shuffle:)];
    
    self.navigationItem.rightBarButtonItem = shuffleButton;
    [shuffleButton release];
}

- (void)shuffle:(id)sender
{
    [claustro initWithScenarioName:_detailItem];
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#ifndef __IPHONE_5_0
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.title = NSLocalizedString(@"Detail", @"Detail");
//    }
    return self;
}
#endif

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[claustro deck]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#ifndef __IPHONE_5_0    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
#else
    static NSString *CellIdentifier = @"DetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
#endif
    
//    NSLog(@"%i, %i", indexPath.row, [[claustro deck]count]);
       
    Tile *cellValue = [[claustro deck] objectAtIndex:indexPath.row];
    cell.textLabel.text = [[claustro titleArray] objectAtIndex:cellValue.title];
    cell.detailTextLabel.text = [[claustro shapeArray] objectAtIndex:cellValue.shape];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", cellValue.imagePath]];
    cell.imageView.image = image;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[claustro deck] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


@end
