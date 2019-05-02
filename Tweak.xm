#import <SpringBoard/SpringBoard.h>

typedef struct SBIconCoordinate {
    NSInteger row;
    NSInteger col;
} SBIconCoordinate;

%hook SBDockIconListView

+ (unsigned long long)maxIcons {
    return 5;
}


-(unsigned long long)iconsInRowForSpacingCalculation {
    return 5;
}

+(unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1 {
    if (arg1 == 0) {
		return 5;
	} else {
		return %orig;
    }
}

// %new
// -(double)distanceBetweenPoints:(CGPoint)point1 point2:(CGPoint)point2 {
//     double dx = (point2.x - point1.x);
//     double dy = (point2.y - point1.y);
//     double dist = sqrt(dx*dx + dy*dy);
//     return dist;
// }

-(CGPoint)originForIconAtCoordinate:(struct SBIconCoordinate)arg1 numberOfIcons:(unsigned long long)arg2 {
    if (arg2 == 5) {
        struct SBIconCoordinate cor1;
        cor1.row = 1;
        cor1.col = 1;

        struct SBIconCoordinate cor2;
        cor2.row = 1;
        cor2.col = 2;

        struct SBIconCoordinate cor3;
        cor3.row = 1;
        cor3.col = 3;

        struct SBIconCoordinate cor4;
        cor4.row = 1;
        cor4.col = 4;

        CGPoint originalPointForIcon1 = %orig(cor1, 4);
        CGPoint originalPointForIcon2 = %orig(cor2, 4);
        CGPoint originalPointForIcon3 = %orig(cor3, 4);
        CGPoint originalPointForIcon4 = %orig(cor4, 4);

        // double defaultSpacing = [self distanceBetweenPoints: originalPointForIcon1, point2:originalPointForIcon2] - 5;
        int defaultY = originalPointForIcon1.y;

        int newIcon1X = originalPointForIcon1.x - 10;
        int newIcon2X = originalPointForIcon2.x - 27;
        int newIcon3X = originalPointForIcon3.x - 43;
        int newIcon4X = originalPointForIcon4.x - 60;
        int newIcon5X = newIcon4X + 70;


        if (arg1.col == 1) {
            return CGPointMake(newIcon1X, defaultY);
        }
        else if (arg1.col == 2) {
            return CGPointMake(newIcon2X, defaultY);
        }
        else if (arg1.col == 3) {
            return CGPointMake(newIcon3X, defaultY);
        }
        else if (arg1.col == 4) {
            return CGPointMake(newIcon4X, defaultY);
        }
        else {
            return CGPointMake(newIcon5X, defaultY);
        }
    }
    return %orig;

}


-(CGPoint)originForIconAtCoordinate:(struct SBIconCoordinate)arg1 {
    // if (arg1.col == 1) {
    //     return CGPointMake(4, 14);
    // }
    // else if (arg1.col == 2) {
    //     return CGPointMake(67, 14);
    // }
    // else if (arg1.col == 3) {
    //     return CGPointMake(130, 14);
    // }
    // else if (arg1.col == 4) {
    //     return CGPointMake(193, 14);
    // }
    // else {
    //     return CGPointMake(256, 14);
    // }
    return %orig;
}

// -(double)effectiveSpacing {
//
// }
//
// -(void)setSpacing:(double)arg1 {
//
// }
// -(double)spacing {
//
// }
%end
