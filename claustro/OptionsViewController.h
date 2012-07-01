//
//  OptionsViewController.h
//  Claustro
//
//  Created by Olivier on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// delegate to return switch value selected by the user
@protocol ModalViewDelegate <NSObject>

-(void)extensionSelected:(BOOL)enabled;

@end


@interface OptionsViewController : UIViewController{
    id<ModalViewDelegate> delegate;
}

@property(nonatomic,retain)IBOutlet UISwitch *toggleSwitch;
@property(nonatomic)BOOL useExtension;
@property(nonatomic, retain)id delegate;

-(IBAction)switchValueChanged:(id)sender;

@end
