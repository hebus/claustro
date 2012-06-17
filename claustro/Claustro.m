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



-(id)init{
    self = [super init];
    
    if ( self ) {
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
    }
    
    return self;
}
-(void) initWithScenarioName:(NSString *)name{
    [self setupDeck];
    
    if([name isEqualToString:kScenario01Survivants]){
        [self scenario_LesSurvivants];
    }
    else if([name isEqualToString:kScenario02RetenirInvasion]){
        [self scenario_RetenirInvasion];
    }
    else if([name isEqualToString:kScenario03FrapperLaTete]){
        [self scenario_LesSurvivants];
    }
    else if([name isEqualToString:kScenario04LesPossedes]){
        [self scenario_Possedes];
    }
    else if([name isEqualToString:kScenario05QuiOseGagne]){
        [self scenario_QuiOseGagne];
    }
    else if([name isEqualToString:kScenario11PurifierParLeFeu]){
        [self scenario_PurifierParLeFeu];
    }
    else if([name isEqualToString:kScenario12Egares]){
        [self scenario_Egares];
    }
    else if([name isEqualToString:kScenario13OuvertureChasse]){

    }
    else if([name isEqualToString:kScenario14AmeDuDemon]){
        [self scenario_AmeDuDemon];
    }
    else if([name isEqualToString:kScenario15ExperimentationAnimale]){
        [self scenario_ExperimentationAnimale];
    }
    else if([name isEqualToString:kScenario16ChasseEtCours]){

    }
    else if([name isEqualToString:kScenario17LaForge]){
        [self scenario_LaForge];
    }
    else if([name isEqualToString:kScenario18LesReliques]){

    }
    else if([name isEqualToString:kScenario81AirPutride]){
        [self scenario_AirPutride];
    }
    else if([name isEqualToString:kScenario82IlEstANous]){
        [self scenario_IlEstANous];
    }
    else if([name isEqualToString:kScenario83Eboulement]){
        [self scenario_Eboulement];
    }
    else if([name isEqualToString:kScenario84Separes]){
        [self scenario_Separes];
    }    
}
-(void)setupDeck{
    
    if(!_deck)
        _deck = [[NSMutableArray alloc]init];
    else {
        [_deck removeAllObjects];
    }
}

#pragma mark - Deck methods
void addToDeck(eTitle title ,eShape shape ,NSMutableArray* deck){
    Tile *t = [[Tile alloc] init];
    [t setTitle:title];
    [t setShape:shape];
    [deck addObject:t];
}

-(void) allTilesToDeck:(NSMutableArray*) deck{
    addToDeck(kSalle_pentacle, kCroisement, deck);
    addToDeck(kSortie, kT, deck);
    addToDeck(kTrou_dans_le_sol,kCouloir,deck);
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
    addToDeck(kTaniere, kT, deck);
    addToDeck(kTaniere, kCroisement, deck);
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

-(void)shuffleDeck{
    // relancer un mélange, depuis l'UI
    shuffleDeck(_deck);
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
    [deck addObjectsFromArray:tmp];
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
    [deck addObjectsFromArray:tmp2];
}
-(void)scenario_Possedes{
    [self scenario_Possedes:_deck];
}
-(void)scenario_Possedes:(NSMutableArray*)deck{
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    [self allTilesToDeck:tmp];
    removeFromDeck(kSortie, tmp);
    removeFromDeck(kSalle_pentacle, tmp);
    removeFromDeckAllTitle(kCache, tmp);
    shuffleDeck(tmp);
    
    // première pile de 3 tuiles
    for (unsigned int i = 0; i < 3; i++) {
        [deck addObject:[tmp objectAtIndex:0]];
        [tmp removeObjectAtIndex:0];
    }
    
    // création de la pile des tuiles caches et mélange
    NSMutableArray *caches = [[NSMutableArray alloc] init];
    addToDeck(kCache,kCouloir,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    shuffleDeck(caches);
    
    // prendre 2 tuiles de la pioche
    NSMutableArray *tmp2 = [[NSMutableArray alloc]init];
    [tmp2 addObject:[tmp objectAtIndex:0]];
    [tmp removeObjectAtIndex:0];
    [tmp2 addObject:[tmp objectAtIndex:0]];
    [tmp removeObjectAtIndex:0];
    // et y ajouter une tuile cache prise au hasard
    [tmp2 addObject:[caches objectAtIndex:0]];
    [caches removeObjectAtIndex:0];
    // faut mettre tmp2 dans deck
    shuffleDeck(tmp2);
    [deck addObjectsFromArray:tmp2];
    
    
    // on remet ça une 3eme fois
    // prendre 2 tuiles de la pioche
    NSMutableArray *tmp3 = [[NSMutableArray alloc]init];
    [tmp3 addObject:[tmp objectAtIndex:0]];
    [tmp removeObjectAtIndex:0];
    [tmp3 addObject:[tmp objectAtIndex:0]];
    [tmp removeObjectAtIndex:0];
    // et y ajouter une tuile cache prise au hasard
    [tmp3 addObject:[caches objectAtIndex:0]];
    [caches removeObjectAtIndex:0];
    // faut mettre tmp2 dans deck
    shuffleDeck(tmp3);
    [deck addObjectsFromArray:tmp3];
    
    // au final on doit obtenir une pile de 9 tuiles dont 2 sont des caches
}
-(void)scenario_QuiOseGagne{
    [self scenario_QuiOseGagne:_deck];
}
-(void)scenario_QuiOseGagne:(NSMutableArray*)deck{
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    [self allTilesToDeck:tmp];
    removeFromDeck(kSortie, tmp);
    removeFromDeck(kSalle_pentacle, tmp);
    removeFromDeckAllTitle(kCache, tmp);
    shuffleDeck(tmp);
    
    // première pile de 8 tuiles
    for (unsigned int i = 0; i < 8; i++) {
        [deck addObject:[tmp objectAtIndex:0]];
        [tmp removeObjectAtIndex:0];
    }
    
    // création de la pile des tuiles caches et mélange
    NSMutableArray *caches = [[NSMutableArray alloc] init];
    addToDeck(kCache,kCouloir,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    addToDeck(kCache,kSans_issue,caches);
    shuffleDeck(caches);
    
    NSMutableArray *tmp2 = [[NSMutableArray alloc]init];
    [tmp2 addObject:[tmp objectAtIndex:0]];
    [tmp2 addObject:[tmp objectAtIndex:1]];
    [tmp2 addObject:[caches objectAtIndex:0]];
    [tmp2 addObject:[caches objectAtIndex:1]];
    shuffleDeck(tmp2);
    
    // ajouter la pile au deck
    [deck addObjectsFromArray:tmp2];
    
    // au final on a une pile de 12 tuiles dont 2 caches se trouvant
    // parmis les 4 dernières
}
@end
