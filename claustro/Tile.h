#import <Foundation/Foundation.h>

#pragma mark boite de base
#define kScenario01Survivants @"Les survivants"
#define kScenario02RetenirInvasion @"Retenir l'invasion"
#define kScenario03FrapperLaTete @"Frapper à la tête"
#define kScenario04LesPossedes @"Les possédés"
#define kScenario05QuiOseGagne @"Qui ose gagne"

#pragma mark exentsion de profundis
#define kScenario11PurifierParLeFeu @"Purifier par le feu"
#define kScenario12Egares @"Egarés"
#define kScenario13OuvertureChasse @"Ouverture de la chasse"
#define kScenario14AmeDuDemon @"L'ame du démon"
#define kScenario15ExperimentationAnimale @"Expérimentation animale"
#define kScenario16ChasseEtCours @"Chasse et cours"
#define kScenario17LaForge @"La forge"
#define kScenario18LesReliques @"Les reliques"

#pragma mark autres
#define kScenario81AirPutride @"Air putride"
#define kScenario82IlEstANous @"Il est a nous"
#define kScenario83Eboulement @"Eboulement"
#define kScenario84Separes @"Séparés"

typedef enum{
	kCouloir = 0,
	kT,
	kCoude,
	kSans_issue,
	kCroisement
} eShape;

typedef enum {
	kTuile = 0,
	kTrou_dans_le_sol,
	kCarnassier,
	kEtroit,
	kCache,
	kCul_de_sac,
	kInonde,
	kPiege,
	kTaniere,
	kZone_sanctifiee,
	kFontaine_de_guerison,
	kMecanisme_demoniaque,
	kSalle_pentacle,
	kSalle_X,
	kSalle_T,
	kPuits_demoniaque,
	kBrume,
	kTombeau,
	kSortie
} eTitle;

@interface Tile : NSObject{
	eShape shape;
	eTitle title;
    NSString *imagePath;
}

@property(nonatomic) eShape shape;
@property(nonatomic) eTitle title;
-(NSString *) imagePath;

@end
