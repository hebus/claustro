//
//  OTOClaustro.m
//  Tableview
//
//  Created by Olivier on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Claustro.h"

@implementation Claustro
@synthesize deck = _deck, shapeArray, titleArray;
@synthesize useExtension;


-(void)setupDeck{
    _deck = [[NSMutableArray alloc]init];
    
    shapeArray = [NSArray arrayWithObjects:@"couloir",@"T",@"coude",@"sans issue",@"croisement",nil];
    titleArray = [NSArray arrayWithObjects:
                  @"Tuile",
                  @"Trou dans le sol",
                  @"Carnassier",
                  @"Etroit",
                  @"Cache",
                  @"Tuile",
                  @"Inonde",
                  @"Piege",
                  @"Taniere",
                  @"Zone sanctifiee",
                  @"Fontaine de guerison",
                  @"Mecanisme demoniaque",
                  @"Salle pentacle",
                  @"Salle X",
                  @"Salle T",
                  @"Puits demoniaque",
                  @"Brume",
                  @"Tombeau",
                  @"Sortie", nil];
    
    // Tuiles de base
    //    allTilesToDeck(deck);
    //    shuffleDeck(deck);
    
    //    scenario_PurifierParLeFeu(deck);
    //    scenario_LaForge(deck);
    //    scenario_RetenirInvasion(deck);
}

#pragma mark - Deck methods
void addToDeck(eTitle title ,eShape shape ,NSMutableArray* deck){
    Tile *t = [[Tile alloc] init];
    [t setTitle:title];
    [t setShape:shape];
    [deck addObject:t];
}

-(void) allTilesToDeck:(NSMutableArray*) deck{
    addToDeck(kTrou_dans_le_sol,kCouloir,deck);
    addToDeck(kTrou_dans_le_sol,kT,deck);
    addToDeck(kCarnassier,kCouloir,deck);
    addToDeck(kCarnassier,kT,deck);
    addToDeck(kEtroit,kCouloir,deck);
    addToDeck(kEtroit,kT,deck);
    addToDeck(kEtroit,kCoude,deck);
    addToDeck(kCache,kCouloir,deck);
    addToDeck(kCache,kSans_issue,deck);
    addToDeck(kCache,kSans_issue,deck);
    addToDeck(kCache,kSans_issue,deck);
    addToDeck(kMecanisme_demoniaque,kCouloir,deck);
    addToDeck(kMecanisme_demoniaque,kT,deck);
    addToDeck(kMecanisme_demoniaque,kCoude,deck);
    addToDeck(kCul_de_sac, kSans_issue, deck);
    addToDeck(kCul_de_sac, kSans_issue, deck);
    addToDeck(kCul_de_sac, kSans_issue, deck);
    addToDeck(kInonde, kCouloir, deck);
    addToDeck(kInonde, kCoude, deck);
    addToDeck(kPiege, kCouloir, deck);
    addToDeck(kPiege, kT, deck);
    addToDeck(kSalle_pentacle, kCroisement, deck);
    addToDeck(kTaniere, kT, deck);
    addToDeck(kTaniere, kCroisement, deck);
    addToDeck(kSortie, kT, deck);
    addToDeck(kTuile, kCouloir, deck);
    addToDeck(kTuile, kCouloir, deck);
    addToDeck(kTuile, kCouloir, deck);
    addToDeck(kTuile, kCouloir, deck);
    addToDeck(kTuile, kT, deck);
    addToDeck(kTuile, kT, deck);
    addToDeck(kTuile, kCoude, deck);
    addToDeck(kTuile, kCoude, deck);
    addToDeck(kTuile, kCoude, deck);
    addToDeck(kTuile, kCroisement, deck);
    addToDeck(kTuile, kCroisement, deck);    
    if([self useExtension]){
        addToDeck(kSalle_X, kCroisement, deck);
        addToDeck(kSalle_T, kT, deck);
        addToDeck(kTombeau, kSans_issue, deck);
        addToDeck(kPuits_demoniaque, kT, deck);
        addToDeck(kFontaine_de_guerison, kT, deck);
        addToDeck(kFontaine_de_guerison, kCoude, deck);
        addToDeck(kBrume, kCouloir, deck);
        addToDeck(kBrume, kCoude, deck);
        addToDeck(kZone_sanctifiee, kCouloir, deck);
        addToDeck(kZone_sanctifiee, kT, deck);
    }
}
void shuffleDeck(NSMutableArray *deck){
    MTwister* randTwist = [ [ MTwister alloc ] init ];
    [randTwist initializeGenerator:[[NSDate date] timeIntervalSince1970]];
    
    for (int i = 0; i<[deck count];i++) {
        NSUInteger randomIndex = [randTwist extractNumber] % ([deck count]- 1 + 1);
        [deck exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }   
}
Tile* fromDeck(eTitle title, NSMutableArray *deck){
    int index = -1; 
    for (unsigned int i = 0; i < [deck count]; i++) {
        Tile *t = [deck objectAtIndex:i];
        if([t title] == title){
            index = i;
            break;
        }
    }    
    return (Tile *)[deck objectAtIndex:index];
}
void removeFromDeck(eTitle title, NSMutableArray *deck){
    for (unsigned int i = 0; i < [deck count]; i++) {
        Tile *t = [deck objectAtIndex:i];
        if([t title] == title){
            [deck removeObjectAtIndex:i];
            break;
        }
    }
}
void removeFromDeckSpecific(eTitle title, eShape shape, NSMutableArray *deck){
    for (unsigned int i = 0; i < [deck count]; i++) {
        Tile *t = [deck objectAtIndex:i];
        if([t title] == title && [t shape] == shape){
            [deck removeObjectAtIndex:i];
            break;
        }
    } 
}
void removeFromDeckAllTitle(eTitle title, NSMutableArray *deck){
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (unsigned int i = 0; i < [deck count]; i++) {
        Tile *t = [deck objectAtIndex:i];
        if([t title] == title){
            [tmp addObject:[deck objectAtIndex:i]];
        }
    }
    for (unsigned int i = 0; i < [tmp count]; i++) {
        [deck removeObject:[tmp objectAtIndex:i]];
    }
}
void removeFromDeckAllShape(eShape shape, NSMutableArray *deck){
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (unsigned int i = 0; i < [deck count]; i++) {
        Tile *t = [deck objectAtIndex:i];
        if([t shape] == shape){
            [tmp addObject:[deck objectAtIndex:i]];
        }
    }
    for (unsigned int i = 0; i < [tmp count]; i++) {
        [deck removeObject:[tmp objectAtIndex:i]];
    }
}

#pragma mark scenario
-(void)scenario_PurifierParLeFeu{
    [self scenario_PurifierParLeFeu:_deck];
}
-(void) scenario_PurifierParLeFeu:(NSMutableArray *)deck{
    // purifier par le feu
    addToDeck(kCache,kSans_issue,deck);
    addToDeck(kCache,kSans_issue,deck);
    addToDeck(kTaniere,kT,deck);
    addToDeck(kTaniere,kCroisement,deck);
    addToDeck(kZone_sanctifiee,kCouloir,deck);
    addToDeck(kFontaine_de_guerison,kT,deck);
    addToDeck(kMecanisme_demoniaque,kT,deck);
    addToDeck(kSalle_X,kCroisement,deck);
    shuffleDeck(deck);
    
    // prendre les 3 dernieres tuiles
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    for (unsigned int i = 0; i < 3; i++) {
        int index = [deck count] - 1;
        Tile *t = [deck objectAtIndex:index];
        [tmp addObject:t];
        [deck removeObjectAtIndex:index];        
    }
    addToDeck(kSortie,kT,tmp);
    addToDeck(kCache,kSans_issue,tmp);
    shuffleDeck(tmp);
    
    // remettre les tuiles dans le deck principal    
    for (unsigned int i = 0; i < [tmp count]; i++) {
        [deck addObject:[tmp objectAtIndex:i]];        
    }
}
-(void)scenario_AirPutride{
    [self scenario_AirPutride:_deck];
}
-(void)scenario_AirPutride:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    shuffleDeck(deck);
}
-(void)scenario_IlEstANous{
    [self scenario_IlEstANous:_deck];
}
-(void)scenario_IlEstANous:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckAllTitle(kCache, deck);
    removeFromDeckAllShape(kSans_issue,deck);
    shuffleDeck(deck);    
}
-(void)scenario_Eboulement{
    [self scenario_Eboulement:_deck];
}
-(void)scenario_Eboulement:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckAllTitle(kEtroit, deck);
    removeFromDeckAllTitle(kCache, deck);
    removeFromDeckAllShape(kSans_issue,deck);
    shuffleDeck(deck);        
}
-(void)scenario_Separes{
    [self scenario_Separes:_deck];
}
-(void) scenario_Separes:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    shuffleDeck(deck);        
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeck(kCul_de_sac,deck);
    removeFromDeck(kCul_de_sac,deck);
}
-(void)scenario_Egares{
    [self scenario_Egares:_deck];
}
-(void) scenario_Egares:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckAllShape(kSans_issue, deck);
    shuffleDeck(deck);
}
-(void)scenario_AmeDuDemon{
    [self scenario_AmeDuDemon:_deck];
}
-(void) scenario_AmeDuDemon:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckAllTitle(kCache, deck);
    shuffleDeck(deck);
}
-(void)scenario_ExperimentationAnimale{
    [self scenario_ExperimentationAnimale:_deck];
}
-(void) scenario_ExperimentationAnimale:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckAllTitle(kTaniere, deck);
    shuffleDeck(deck);
}
-(void)scenario_LaForge{
    [self scenario_LaForge:_deck];
}
-(void) scenario_LaForge:(NSMutableArray *)deck{
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    removeFromDeckSpecific(kCarnassier, kT, deck);
    shuffleDeck(deck);
}
-(void)scenario_LesSurvivants{
    [self scenario_LesSurvivants:_deck];
}
-(void) scenario_LesSurvivants:(NSMutableArray *)deck{
    // le scenario frapper a la tete a une mise en place identique
    
    [self allTilesToDeck:deck];
    removeFromDeck(kSortie, deck);
    removeFromDeck(kSalle_pentacle,deck);
    shuffleDeck(deck);
}
-(void)scenario_RetenirInvasion{
    [self scenario_RetenirInvasion:_deck];
}
-(void) scenario_RetenirInvasion:(NSMutableArray *)deck{
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    [self allTilesToDeck:tmp];
    removeFromDeck(kSortie, tmp);
    removeFromDeck(kSalle_pentacle, tmp);
    removeFromDeckAllTitle(kCache, tmp);
    shuffleDeck(tmp);
    
    // remettre les tuiles dans le deck principal    
    for (unsigned int i = 0; i < 12; i++) {
        [deck addObject:[tmp objectAtIndex:i]];        
    }
    
    // création de la pile des tuiles caches
    NSMutableArray *caches = [[NSMutableArray alloc] init];
    addToDeck(kCache,kCouloir,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    shuffleDeck(caches);

    // créer une nouvelle pile de 3 tuiles + 1 tuiles caches au hasard
    // de la pile des tuiles cache
    NSMutableArray *tmp2 = [[NSMutableArray alloc] init];
    for (unsigned int i = 0; i < 3; i++) {
        [tmp2 addObject:[tmp objectAtIndex:i]];
    }
    // y a ajouter une tuile cache
    [tmp2 addObject:[caches objectAtIndex:0]];
    shuffleDeck(tmp2);
    
    // integrer les tuiles dans le deck principal
    for (unsigned int i = 0; i < [tmp2 count]; i++) {
        [deck addObject:[tmp2 objectAtIndex:i]];        
    }
}
@end
