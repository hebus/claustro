#import <Foundation/Foundation.h>

#define kScenarioSurvivants @"Les survivants"
#define kScenarioRetenirInvasion @"Retenir l'invasion"
#define kScenarioFrapperLaTete @"Frapper à la tête"
#define kScenarioPurifierParLeFeu @"Purifier par le feu"
#define kScenarioAirPutride @"Air putride"
#define kScenarioIlEstANous @"Il est a nous"
#define kScenarioEboulement @"Eboulement"
#define kScenarioSepares @"Séparés"
#define kScenarioEgares @"Egarés"
#define kScenarioAmeDuDemon @"L'ame du démon"
#define kScenarioExperimentationAnimale @"Expérimentation animale"
#define kScenarioLaForge @"La forge"
#define kScenarioLesPossedes @"Les possédés"
#define kScenarioQuiOseGagne @"Qui ose gagne"

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
