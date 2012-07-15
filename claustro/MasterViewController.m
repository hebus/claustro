//
//  MasterViewController.m
//  claustro
//
//  Created by Christina on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "OptionsViewController.h"
#import "Tile.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController;
@synthesize didUseExtension = _didUseExtension;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIButton *options = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [options addTarget:self action:@selector(options:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithCustomView:options];
    self.navigationItem.rightBarButtonItem = optionsButton;
    self.title = @"Scenario";
    [optionsButton release];
    
    // permet de définir une image en background de la tableview
//    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackgroundDark.png"]];
//    self.tableView.backgroundView = view;
    
    [self reloadScenario];
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

- (void)options:(id)sender
{
    OptionsViewController *optionsView = [[OptionsViewController alloc] initWithNibName:nil bundle:nil];
    optionsView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    optionsView.useExtension = _didUseExtension;
    optionsView.delegate = self;
    [self presentModalViewController:optionsView animated:YES];
}

-(void)extensionSelected:(BOOL)enabled{
    _didUseExtension = enabled;
    [self reloadScenario];
    [[self tableView] reloadData];
}

#pragma mark - data
-(void)reloadScenario{
    if(!_objects){
        _objects = [[[NSMutableArray alloc]init] retain];
    }
    else {
        [_objects removeAllObjects];
    }
    
    NSArray *base = [[NSArray alloc] initWithObjects:kScenario01Survivants, kScenario02RetenirInvasion,
                     kScenario03FrapperLaTete, kScenario04LesPossedes, kScenario05QuiOseGagne, nil];
    NSDictionary *baseDic = [NSDictionary dictionaryWithObject:base forKey:@"scenario"];
    [_objects addObject:baseDic];
    [base release];
    
    if(_didUseExtension){
        NSArray *extension1 = [[NSArray alloc] initWithObjects:kScenario11PurifierParLeFeu, kScenario12Egares, 
                               /*kScenario13OuvertureChasse,*/ kScenario14AmeDuDemon, kScenario15ExperimentationAnimale,
                               /*kScenario16ChasseEtCours,*/ kScenario17LaForge, /*kScenario18LesReliques,*/ nil];
        NSDictionary *extDic = [NSDictionary dictionaryWithObject:extension1 forKey:@"scenario"];
        [_objects addObject:extDic];
        [extension1 release];
    }
    NSArray *autres = [[NSArray alloc] initWithObjects:kScenario81AirPutride, kScenario82IlEstANous, kScenario83Eboulement,
                       kScenario84Separes, nil];
    NSDictionary *autresDic = [NSDictionary dictionaryWithObject:autres forKey:@"scenario"];
    [_objects addObject:autresDic];
    
    [autres release];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_objects count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[_objects objectAtIndex:section] objectForKey:@"scenario"] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"Boîte de base";
    }
    else if(section == 1 && _didUseExtension){
        return @"De Profundis";
    }
    else {
        return @"Autres";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#ifndef __IPHONE_5_0    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
#else
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
#endif
    NSString *cellValue = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"scenario"] objectAtIndex:indexPath.row];
    cell.textLabel.text = NSLocalizedString(cellValue,"");
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

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

#ifndef __IPHONE_5_0
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *name = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"scenario"] objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:name withExtension:_didUseExtension];
    }
}
#else
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    
    NSString *name = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"scenario"] objectAtIndex:indexPath.row];

    [detailViewController setDetailItem:name withExtension:_didUseExtension];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}
#endif

@end
