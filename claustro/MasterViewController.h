//
//  MasterViewController.h
//  claustro
//
//  Created by Christina on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController<ModalViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
