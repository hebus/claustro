//
//  OptionsViewController.m
//  Claustro
//
//  Created by Olivier on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController
@synthesize toggleSwitch;
@synthesize useExtension;
@synthesize delegate;

-(void)switchValueChanged:(id)sender{
    
    if([delegate respondsToSelector:@selector(useExtensionSelected:)]){
        if(toggleSwitch.on)
            [delegate useExtensionSelected:YES];
        else {
            [delegate useExtensionSelected:NO];
        }        
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [toggleSwitch setOn:useExtension];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
