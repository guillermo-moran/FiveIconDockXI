#import <SpringBoard/SpringBoard.h>

typedef struct SBIconCoordinate {
    NSInteger row;
    NSInteger col;
} SBIconCoordinate;

%hook SBIconListGridLayoutConfiguration

- (NSUInteger)numberOfPortraitColumns {
    NSUInteger rows = MSHookIvar<NSUInteger>(self, "_numberOfPortraitRows");
    if (rows == 1)
        return 5;
    return %orig;
}

%end 

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

        int defaultY = originalPointForIcon1.y;

        int newIcon1X = originalPointForIcon1.x - (int)(originalPointForIcon1.x * 0.21);
        int newIcon2X = originalPointForIcon2.x - (int)(originalPointForIcon2.x * 0.21);
        int newIcon3X = originalPointForIcon3.x - (int)(originalPointForIcon3.x * 0.21);
        int newIcon4X = originalPointForIcon4.x - (int)(originalPointForIcon4.x * 0.21);
        int newIcon5X = originalPointForIcon4.x + (int)(originalPointForIcon4.x * 0.03);


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

%end
