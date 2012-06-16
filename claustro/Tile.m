#import "Tile.h"

@implementation Tile

@synthesize shape, title;


-(NSString*)imagePath{
    NSString *path;
    switch (title) {
        case kCache:
            path = @"cache";
            break;
        case kCarnassier:
            path = @"carnassier";
            break;
        case kEtroit:
            path = @"etroit";
            break;
        case kInonde:
            path = @"inonde";
            break;
        case kPiege:
            path = @"piege";
            break;
        case kMecanisme_demoniaque:
            path = @"mecanismedemoniaque";
            break;
        case kSalle_pentacle:
            path = @"sallepentacle";
            break;
        case kSortie:
            path = @"sortie";
            break;
        case kTaniere:
            path = @"taniere";
            break;
        case kTrou_dans_le_sol:
            path = @"troudanslesol";
            break;
        case kBrume:
            path = @"brume";
            break;
        case kFontaine_de_guerison:
            path = @"fontaineguerison";
            break;
        case kPuits_demoniaque:
            path = @"puitdemoniaque";
            break;
        case kSalle_T:
            path = @"salle";
            break;
        case kSalle_X:
            path = @"salle";
            break;
        case kTombeau:
            path = @"tombeau";
            break;
        case kZone_sanctifiee:
            path = @"zonesanctifiee";
            break;
            
        default:
            path = nil;
            break;
    }
    return path;
}

@end