//
//  OptionsViewController.h
//  Claustro
//
//  Created by Olivier on 11/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// delegate to return switch value selected by the user
@protocol useExtensionDelegate <NSObject>

-(void)useExtensionSelected:(BOOL)enabled;

@end


@interface OptionsViewController : UIViewController{
    id<useExtensionDelegate> delegate;
}

@property(nonatomic,retain)IBOutlet UISwitch *toggleSwitch;
@property(nonatomic)BOOL useExtension;
@property(nonatomic)id delegate;

-(IBAction)switchValueChanged:(id)sender;

@end
