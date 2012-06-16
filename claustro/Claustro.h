//
//  pour commit sur github.com faire depuis le Terminal et dans le dossier de l'application :
//  git push origin master
//  une fois les modifications commitées en local
//
//  OTOClaustro.h
//  Tableview
//
//  Created by Olivier on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTwister.h"
#import "Tile.h"

@interface Claustro : NSObject{

}

@property(nonatomic,retain)NSMutableArray *deck;
@property(nonatomic,retain)NSArray *titleArray;
@property(nonatomic,retain)NSArray *shapeArray;
@property(nonatomic)BOOL useExtension;

-(void) allTilesToDeck:(NSMutableArray*) deck;
-(void) setupDeck;
-(void) scenario_LesSurvivants;
-(void) scenario_RetenirInvasion;

-(void) scenario_PurifierParLeFeu;
-(void) scenario_Egares;
-(void) scenario_AmeDuDemon;
-(void) scenario_ExperimentationAnimale;
-(void) scenario_LaForge;

-(void) scenario_AirPutride;
-(void) scenario_IlEstANous;
-(void) scenario_Eboulement;
-(void) scenario_Separes;


@end
