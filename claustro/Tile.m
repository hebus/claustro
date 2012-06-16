#import "Tile.h"

@implementation Tile

@synthesize shape, title;


-(NSString*)imagePath{
    NSString *path;
    switch (title) {
        case kCache:
            path = @"picto/cache";
            break;
        case kCarnassier:
            path = @"picto/carnassier";
            break;
        case kEtroit:
            path = @"picto/etroit";
            break;
        case kInonde:
            path = @"picto/inonde";
            break;
        case kPiege:
            path = @"picto/piege";
            break;
        case kMecanisme_demoniaque:
            path = @"picto/mecanismedemoniaque";
            break;
        case kSalle_pentacle:
            path = @"picto/sallepentacle";
            break;
        case kSortie:
            path = @"picto/sortie";
            break;
        case kTaniere:
            path = @"picto/taniere";
            break;
        case kTrou_dans_le_sol:
            path = @"picto/troudanslesol";
            break;
        case kBrume:
            path = @"picto/brume";
            break;
        case kFontaine_de_guerison:
            path = @"picto/fontaineguerison";
            break;
        case kPuits_demoniaque:
            path = @"picto/puitdemoniaque";
            break;
        case kSalle_T:
            path = @"picto/salle";
            break;
        case kSalle_X:
            path = @"picto/salle";
            break;
        case kTombeau:
            path = @"picto/tombeau";
            break;
        case kZone_sanctifiee:
            path = @"picto/zonesanctifiee";
            break;
            
        default:
            path = nil;
            break;
    }
    return path;
}

@end