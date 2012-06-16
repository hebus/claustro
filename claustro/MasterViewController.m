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
    BOOL _didUseExtension;
}
@end

@implementation MasterViewController


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(options:)];
    self.navigationItem.rightBarButtonItem = optionsButton;
    
    _didUseExtension = NO;
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
        _objects = [[NSMutableArray alloc]init];
    }
    else {
        [_objects removeAllObjects];
    }
    
    NSArray *base = [[NSArray alloc] initWithObjects:kScenario01Survivants, kScenario02RetenirInvasion,
                     kScenario03FrapperLaTete, kScenario04LesPossedes, kScenario05QuiOseGagne, nil];
    NSDictionary *baseDic = [NSDictionary dictionaryWithObject:base forKey:@"scenario"];
    [_objects addObject:baseDic];
    
    if(_didUseExtension){
        NSArray *extension1 = [[NSArray alloc] initWithObjects:kScenario11PurifierParLeFeu, kScenario12Egares, 
                               kScenario13OuvertureChasse, kScenario14AmeDuDemon, kScenario15ExperimentationAnimale,
                               kScenario16ChasseEtCours, kScenario17LaForge, kScenario18LesReliques, nil];
        NSDictionary *extDic = [NSDictionary dictionaryWithObject:extension1 forKey:@"scenario"];
        [_objects addObject:extDic];
    }
    NSArray *autres = [[NSArray alloc] initWithObjects:kScenario81AirPutride, kScenario82IlEstANous, kScenario83Eboulement,
                       kScenario84Separes, nil];
    NSDictionary *autresDic = [NSDictionary dictionaryWithObject:autres forKey:@"scenario"];
    [_objects addObject:autresDic];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    NSString *cellValue = [[[_objects objectAtIndex:indexPath.section] objectForKey:@"scenario"] objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
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
        [_objects removeObjectAtIndex:indexPath.row];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = [_objects objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
